ascii_art='
  _________.__
 /   _____/|  |__ _____    ____    ____   ____
 \_____  \ |  |  \\__  \  /    \  / ___\ /  _ \
 /        \|   Y  \/ __ \|   |  \/ /_/  >  <_> )
/_______  /|___|  (____  /___|  /\___  / \____/
        \/      \/     \/     \//_____/
'

# Define the color gradient (shades of cyan and blue)
colors=(
  '\033[38;5;209m' # Soft Coral (Gentle Flame)
  '\033[38;5;215m' # Warm Peach (Warm Glow)
  '\033[38;5;179m' # Muted Gold (Subdued Ember)
  '\033[38;5;172m' # Burnt Sienna (Smoldering Warmth)
  '\033[38;5;137m' # Soft Bronze (Fading Heat)
  '\033[38;5;94m'  # Deep Ochre (Cooling Embers)
  '\033[38;5;131m' # Rusty Brown (Dying Fire)
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
  color_index=$((i % ${#colors[@]}))
  echo -e "${colors[color_index]}${lines[i]}"
done
