<div align="center">
    <h1>【 end_4's Hyprland dotfiles 】</h1>
    <h3></h3>
</div>

<div align="center"> 

![](https://img.shields.io/github/last-commit/end-4/dots-hyprland?&style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/stars/end-4/dots-hyprland?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/repo-size/end-4/dots-hyprland?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)
<a href="https://discord.gg/GtdRBXgMwq"> <img alt="Dynamic JSON Badge" src="https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdiscordapp.com%2Fapi%2Finvites%2FGtdRBXgMwq%3Fwith_counts%3Dtrue&query=approximate_member_count&style=for-the-badge&logo=discord&logoColor=D9E0EE&label=discord&labelColor=%231E202B&color=86dbc0&link=https%3A%2F%2Fdiscord.gg%2FGtdRBXgMwq"> </a>

</div>

<div align="center">
    <h2>• overview •</h2>
    <h3></h3>
</div>

> [!WARNING]  
> Hyprland 0.55 update:
> If your distro has not shipped Hyprland 0.55 and/or you're not ready for it, you should switch to the Pre-Hyprland Luaification release (or not update yet, if you're going to do that). See the wiki for more info: [Install](https://ii.clsty.link/en/ii-qs/01setup/#automated-installation) | [Update](https://ii.clsty.link/en/ii-qs/01setup/#updating)

<details> 
  <summary>What this is/isn't</summary>

  - Technically, configuration files
  - Realistically, mostly the custom graphical shell
  - NOT a system setup script: no graphic drivers, no zram setup, etc.
  
</details>

<details> 
  <summary>Notable features</summary>
     
  - **Overview**: Shows open apps with live previews
  - **AI**: Gemini, Ollama, and more
  - **QoL**: screen translation, anti-flashbang, Google Lens
  - **Material themes**: Choose your wallpaper, done, enjoy
  - **Transparent installation**: Every command is shown before it's run
</details>

<details> 
  <summary>Installation</summary>

   - **IMPORTANT: Hyprland 0.55 Update**: If your distro has not shipped Hyprland 0.55 and/or you're not ready for it, you should switch to the Pre-Hyprland Luaification release. See [the wiki](https://ii.clsty.link/en/ii-qs/01setup/) for more info
   - Just run `bash <(curl -s https://ii.clsty.link/get)`
     - Or, clone this repo and run `./setup install`
     - See [the wiki](https://ii.clsty.link/en/ii-qs/01setup/) for more details
   - **Keybinds**: Should be somewhat familiar to Windows or GNOME users. Important ones:
     - `Super`+`/` = keybind list
     - `Super`+`Enter` = terminal


</details>

<details>
  <summary>Software overview</summary>

  | Software | Purpose |
  | ------------- | ------------- |
  | [Hyprland](https://github.com/hyprwm/hyprland) | The compositor (manages and renders windows) |
  | [Quickshell](https://quickshell.outfoxxed.me/) | A QtQuick-based widget system, used for the status bar, sidebars, etc. |
  | Others | See [deps-info.md](https://github.com/end-4/dots-hyprland/blob/main/sdata/deps-info.md) |

</details>

<details>
    <summary>Discord</summary>
        <a href="https://discord.gg/GtdRBXgMwq"> Server link</a> | I hope this provides a friendlier environment for support without needing me to personally accept every friend request/DM. For real issues, prefer GitHub

</details>

<div align="center">
    <h2>• screenshots •</h2>
    <h3></h3>
</div>

## Meu setup atual

Este repositório é a configuração do meu desktop Linux com Hyprland, Quickshell, Kitty e Neovim. A ideia é unir produtividade, automação e uma interface visualmente consistente, sem abrir mão da velocidade do teclado.

O visual atual foi evoluído para uma linguagem de **liquid glass**: painéis translúcidos, desfoque, bordas arredondadas, sombras suaves e cores derivadas do wallpaper. O resultado é uma interface com profundidade, mas ainda legível e funcional.

### O que foi atualizado

- **Matugen em todo o desktop**: o wallpaper alimenta a paleta do sistema e mantém barra, painéis, widgets e terminal visualmente sincronizados.
- **Widgets de fundo**: calendário, relógio, clima, status do celular, contador pessoal, dock e controle de mídia ficam integrados ao desktop sem parecerem janelas soltas.
- **Galeria do celular via Wi‑Fi**: um widget consulta os álbuns da galeria do celular através do KDE Connect e traz essas imagens para dentro do desktop.
- **Bateria na barra superior**: um widget dedicado exibe rapidamente o nível da bateria do celular na barra, mantendo o estado do dispositivo sempre visível.
- **Liquid glass**: superfícies com transparência e blur criam camadas sobre o wallpaper, enquanto o contraste e os espaçamentos mantêm a leitura confortável.
- **Painel lateral inteligente**: `Super`+`A` abre a central com recursos de IA, tradução e outras ferramentas sem tirar o foco do workspace.
- **Folha de atalhos completa**: `Super`+`/` mostra os atalhos de shell, janelas, mídia, screenshots, workspaces e sessão.
- **Fluxo de desenvolvimento**: Neovim para editar a configuração, Kitty como terminal principal e terminal flutuante centralizado para comandos rápidos e inspeção do sistema.
- **Workspaces limpos**: cada workspace pode ficar dedicado a uma tarefa, com o shell e os widgets permanecendo sempre disponíveis no fundo.

### Galeria do setup

| 4 · Matugen + widgets de fundo | 3 · Painel lateral liquid glass |
|:---:|:---:|
| ![Desktop com Matugen e widgets](assets/screenshots/04-matugen-liquid-glass.png) | ![Painel lateral com efeito liquid glass](assets/screenshots/03-panel-liquid-glass.png) |
| 5 · Atalhos do sistema | 1 · Neovim + terminal flutuante |
|:---:|:---:|
| ![Folha de atalhos do Hyprland](assets/screenshots/05-shortcuts-liquid-glass.png) | ![Neovim com terminal flutuante exibindo neofetch](assets/screenshots/01-neovim-neofetch.png) |

As imagens acima foram capturadas do sistema em execução, com a mídia limpa para destacar o desktop, os widgets e o acabamento visual do shell.

<div align="center">
    <h2>• thank you •</h2>
    <h3></h3>
</div>

 - [@clsty](https://github.com/clsty) for making the dotfiles accessible by taking care of the install script and many other things
 - [@midn8hustlr](https://github.com/midn8hustlr) for greatly improving the color generation system
 - [@outfoxxed](https://github.com/outfoxxed/) for being extremely supportive in my Quickshell journey
 - Quickshell: [Soramane](https://github.com/caelestia-dots/shell/), [FridayFaerie](https://github.com/FridayFaerie/quickshell), [nydragon](https://github.com/nydragon/nysh)
 - AGS: [Aylur](https://github.com/Aylur/dotfiles/tree/ags-pre-ts), [kotontrion](https://github.com/kotontrion/dotfiles)
 - EWW: [fufexan](https://github.com/fufexan/dotfiles)

<div align="center">
    <h2>• stonks •</h2>
    <h3></h3>
</div>

- I promise not to attempt an +ULTRARICOSHOT irl... Coins can go here: https://github.com/sponsors/end-4
- Tentacle cat hub twinkle internet points

[![Stargazers over time](https://starchart.cc/end-4/dots-hyprland.svg?variant=adaptive)](https://starchart.cc/end-4/dots-hyprland)


---

<div align="center">
    <h2>• previous styles •</h2>
    <h3></h3>
</div>

- **Unsupported!**
- **Source**: illogical-impulse AGS in `ii-ags` branch, others in `archive` branch.
- List is in reverse chronological order

### illogical-impulse (AGS)

Widget system: AGS | Support: No

Versão anterior baseada em AGS. Mantida apenas como referência histórica.

#### m3ww

Widget system: EWW | Support: No

Versão anterior baseada em EWW, sem suporte ativo.

#### NovelKnock

Widget system: EWW | Support: No

Variação visual experimental, sem suporte ativo.

#### Hybrid

Widget system: EWW | Support: No

Variação experimental com foco em interações circulares, sem suporte ativo.

#### Windoes

Widget system: EWW | Support: No

Variação inspirada no Windows, sem suporte ativo.



<div align="center">
    <h2>• inspirations/copying •</h2>
    <h3></h3>
</div>

 - Inspiration: osu!lazer (Hybrid), Windows 11 (Windoes), AvdanOS (NovelKnock), Material Design 3 (m3ww & later)
 - Copying: Absolutely, feel free. Just follow the license and it's all good
 
