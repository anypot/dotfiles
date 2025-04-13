default:
  @just --list

color color:
  @chezmoi init --promptChoice "Color scheme"="{{color}}" && chezmoi apply && killall -SIGUSR2 waybar && makoctl reload

diff:
  @chezmoi diff --exclude scripts

test-template tmpl:
  @chezmoi execute-template < {{tmpl}}
