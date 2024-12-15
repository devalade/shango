set -e

ascii_art='_________.__                                  
 /   _____/|  |__ _____    ____    ____   ____  
 \_____  \ |  |  \\__  \  /    \  / ___\ /  _ \ 
 /        \|   Y  \/ __ \|   |  \/ /_/  >  <_> )
/_______  /|___|  (____  /___|  /\___  / \____/ 
        \/      \/     \/     \//_____/         '

echo -e "$ascii_art"
echo "=> Shango is Linux base tools!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Shango..."
rm -rf ~/.local/share/shango

show_progress() {
  local pid=$1
  local delay=0.5
  local spinstr='|/-\'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

(
  git clone https://github.com/devalade/shango.git ~/.local/share/shango
) &

show_progress $!

# if [[ $SHANGO_REF != "main" ]]; then
#   cd ~/.local/share/shango
#   git fetch origin "${SHANGO_REF:-stable}" && git checkout "${SHANGO_REF:-stable}"
#   cd -
# fi

source ~/.local/utils/global-variables.sh
source ~/.local/utils/prompt-to-add-path.sh
source ~/.local/utils/show_progress

echo "Installation starting..."
echo ""
echo "Installing gum for better experience."
source ~/.local/share/shango/dependencies/app-gum.sh >/dev/null

prompt_to_add_path
