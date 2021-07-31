#!/usr/bin/env bash

DEFAULT_FILE="$HOME/.volta-dump"

function list() {
  volta list --quiet --default --format plain \
    | cut -d " " -f 2 - \
    | paste -sd " " -
}

function generateCommand() {
  echo -n "volta install "
  list
}

function generateScript() {
  echo "#!/usr/bin/env bash"
  echo
  echo "# Generated via '~/bin/volta-dump.sh'."
  echo
  generateCommand
}

function writeScript() {
  echo "Writing script to '$1'."
  generateScript > "$1"
  chmod +x "$1"
  echo "Done!"
  echo
  echo "Remember to commit the changes, e.g.:"
  echo "git add --force '$1' && git commit -m 'chore(volta): update dump' && git push"
}

if [[ "$1" == "-" ]]; then
  generateCommand
else
  writeScript "${1:-$DEFAULT_FILE}"
fi
