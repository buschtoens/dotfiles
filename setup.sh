# This script performs the initial setup for new machines. It is invoked like:
#
#    $ curl -LfsS https://buschtoens.github.io/dotfiles/setup.sh | bash
#
cd ~
git init
git remote add origin git@github.com:buschtoens/dotfiles.git
git fetch
git checkout --force main
git branch --set-upstream-to origin/main
