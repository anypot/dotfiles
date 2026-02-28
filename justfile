default:
  @just --list

list-colors:
  @echo "catppuccin" "dracula" "gruvbox" "kanagawa" "onedark" "rose-pine" "solarized" "tokyonight"

color termColor nvimColor sysColor:
  @chezmoi init \
    --promptChoice "Terminal color scheme"="{{termColor}}" \
    --promptChoice "Neovim color scheme"="{{nvimColor}}" \
    --promptChoice "System color scheme"="{{sysColor}}" \
    && chezmoi apply && killall -SIGUSR2 waybar && makoctl reload

onecolor Color:
  @chezmoi init \
    --promptChoice "Terminal color scheme"="{{Color}}" \
    --promptChoice "Neovim color scheme"="{{Color}}" \
    --promptChoice "System color scheme"="{{Color}}" \
    && chezmoi apply && killall -SIGUSR2 waybar && makoctl reload

twocolor sysTermColor nvimColor:
  @chezmoi init \
    --promptChoice "Terminal color scheme"="{{sysTermColor}}" \
    --promptChoice "Neovim color scheme"="{{nvimColor}}" \
    --promptChoice "System color scheme"="{{sysTermColor}}" \
    && chezmoi apply && killall -SIGUSR2 waybar && makoctl reload

diff:
  @chezmoi diff --exclude scripts

test-template tmpl:
  @chezmoi execute-template < {{tmpl}}
