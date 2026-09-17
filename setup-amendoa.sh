#!/bin/bash
set -e

echo "=== Setup pessoal do amendoa ==="

# --- Pacotes ---
echo ">>> Instalando pacotes..."
sudo pacman -S --needed --noconfirm \
    kdeconnect \
    sshfs \
    opentabletdriver \
    nmap \
    photoqt \
    base-devel cmake meson cpio git pkgconf

# --- FUSE ---
echo ">>> Configurando /etc/fuse.conf..."
if ! grep -q "^user_allow_other" /etc/fuse.conf; then
    sudo sed -i 's/^#user_allow_other/user_allow_other/' /etc/fuse.conf
fi

# --- Firewall ---
if command -v ufw &> /dev/null; then
    echo ">>> Liberando portas do KDE Connect..."
    sudo ufw allow 1714:1764/tcp
    sudo ufw allow 1714:1764/udp
fi

# --- hyprglass ---
echo ">>> Compilando hyprglass..."
if [ ! -d "$HOME/hyprglass" ]; then
    git clone https://github.com/hyprnux/hyprglass "$HOME/hyprglass"
fi
cd "$HOME/hyprglass"
git pull
make all
cd - > /dev/null

# --- Automount do celular ---
echo ">>> Instalando script de automount..."
mkdir -p "$HOME/.local/bin"
cat > "$HOME/.local/bin/kdeconnect-automount.sh" << 'SCRIPT'
#!/bin/bash
# Troque DEVICE pelo ID do aparelho (kdeconnect-cli -a --id-only)
DEVICE="fe08adfa88664ff488cafe2d338d96fd"
MOUNTPOINT="/run/user/$(id -u)/$DEVICE"

while true; do
    if kdeconnect-cli -a --id-only 2>/dev/null | grep -q "$DEVICE"; then
        if grep -q " $MOUNTPOINT " /proc/mounts; then
            if ! timeout 5 ls "$MOUNTPOINT" > /dev/null 2>&1; then
                fusermount -uz "$MOUNTPOINT" 2>/dev/null
                kdeconnect-cli -d "$DEVICE" --mount
            fi
        else
            kdeconnect-cli -d "$DEVICE" --mount
        fi
    fi
    sleep 30
done
SCRIPT
chmod +x "$HOME/.local/bin/kdeconnect-automount.sh"

# --- Funcao qsr do fish ---
echo ">>> Instalando funcao qsr..."
mkdir -p "$HOME/.config/fish/functions"
cat > "$HOME/.config/fish/functions/qsr.fish" << 'SCRIPT'
function qsr --description "Reinicia o Quickshell limpo"
    pkill qs
    pkill -f "nmcli monitor"
    sleep 1
    qs -c ii & disown
end
SCRIPT

# --- Servicos ---
echo ">>> Habilitando OpenTabletDriver..."
systemctl --user enable --now opentabletdriver.service 2>/dev/null || \
    echo "  (falhou - confira: systemctl --user list-unit-files | grep -i tablet)"

echo
echo "=== Pronto ==="
echo "Falta na mao:"
echo "  1. Parear o celular no KDE Connect"
echo "  2. Trocar o DEVICE em ~/.local/bin/kdeconnect-automount.sh"
echo "  3. Ajustar monitors.conf pro seu hardware"
