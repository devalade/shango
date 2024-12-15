source $HOME/.local/utils/global-variables.sh

prompt_to_add_path() {
  # Detect the shell type
  shell_type=$(basename "$SHELL")

  # Determine which file to modify based on the shell type
  case "$shell_type" in
  bash)
    file=~/.bash_profile
    ;;
  zsh)
    file=~/.zshrc
    ;;
  *)
    echo "${RED}${BOLD}❌ Unable to detect shell type.${RESET}"
    echo "To add 'shango' to your path manually, add the following line to your shell's profile file:"
    echo 'export PATH="'${SHANGO_HOME}'/bin:$PATH"'
    return 1
    ;;
  esac

  # Check if SHANGO_HOME is set to the default value
  if [ "$SHANGO_HOME" = "$HOME/.local/share/shango" ]; then
    path_value='$HOME/.local/share/shango'
  else
    path_value=$SHANGO_HOME
  fi

  # Dynamically build the grep pattern
  grep_pattern=$(echo 'export PATH="'$path_value'/bin:$PATH"')

  # Check if the path is already in the file
  if ! grep -qF "$grep_pattern" "$file"; then
    echo "Shango detected your shell environment:"
    echo "👉 Shell Type: \"$shell_type\"."
    echo "👉 Shell Profile: \"$file\"."

    if [ -z "$set_path_automatically" ]; then
      read -n 1 -p "${BOLD}${YELLOW}Would you like Shango to add itself to your PATH? [y/N] ${RESET}" response
      echo # Empty line

      if [[ "$response" =~ ^[Yy]$ ]]; then
        set_path_automatically=1
      else
        set_path_automatically=0
      fi
    fi
  else
    echo "✅ Correct PATH detected in \"$file\"."
  fi

  if [ "$set_path_automatically" = 1 ]; then
    echo "👉 Adding Shango to your PATH in \"$file\"."
    echo 'export PATH="'$path_value'/bin:$PATH"' >>"$file"
  fi
}
