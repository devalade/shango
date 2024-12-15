set -e
source ./utils/global-variables.sh
source ./utils/prompt-to-add-path.sh

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
git clone https://github.com/devalade/shango.git ~/.local/share/shango >/dev/null
if [[ $SHANGO_REF != "main" ]]; then
  cd ~/.local/share/shango
  git fetch origin "${SHANGO_REF:-stable}" && git checkout "${SHANGO_REF:-stable}"
  cd -
fi

echo "Installation starting..."
echo ""
echo "Installing gum for better experience."
source ~/.local/share/shango/dependencies/app-gum.sh >/dev/null

prompt_to_add_path
