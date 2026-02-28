#! /usr/bin/env bash

# Riverctl script to open scratchpads, and open programs if Scratchpads are
# empty. Usage "./scratchpads.sh <top|handy|yazi|dot>"

if [ -z "$1" ]; then
  echo "Error: No argument provided."
  exit 1
fi

terminal="alacritty"

case "$1" in
"top")
  app_id="scratch-bottom"
  cmd="${terminal} --class ${app_id} --title Bottom --command zsh -ic 'btm --basic'"
  tag=$((1 << (10 - 1)))
  ;;
"handy")
  app_id="Handy"
  cmd="handy"
  tag=$((1 << (11 - 1)))
  ;;
"yazi")
  app_id="scratch-yazi"
  cmd="${terminal} --class ${app_id} --title Yazi --command zsh -ic yazi"
  tag=$((1 << (12 - 1)))
  ;;
"dot")
  app_id="scratch-dotfiles"
  cmd="${terminal} --class ${app_id} --title Dotfiles --command zsh -ic 'dot'"
  tag=$((1 << (13 - 1)))
  ;;
*)
  echo "Unhandled case provided. Exiting"
  exit 1
  ;;
esac

if lswt | grep -q "${app_id}"; then
  riverctl set-focused-tags "${tag}"
else
  riverctl spawn "${cmd}"
  riverctl set-focused-tags "${tag}"
fi
