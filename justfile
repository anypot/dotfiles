default:
  @just --list

test-template tmpl:
  @chezmoi execute-template < {{tmpl}}
