source $HOME/.local/share/shango/utils/global-variables.sh

replace_variables() {
  local template_path="$1"
  local username="${2:-}"
  local appName="${3:-}"
  local domainName="${4:-}"
  local ipAddress="${5:-}"
  local port="${6:-3000}"

  local deploy_input_file="$template_path/deploy.yml.stub"
  local deploy_output_file="deploy.yml"

  local dockerfile_input_file="$template_path/Dockerfile.stub"
  local dockerfile_output_file="Dockerfile"

  sudo mkdir -p config
  sudo chmod 755 config # Ensure the directory has the correct permissions

  if [ -f "config/$deploy_output_file" ]; then
    sudo rm -rf "config/$deploy_output_file"
  fi

  sudo sed -e "s/{{ username }}/${username}/g" \
    -e "s/{{ appName }}/${appName}/g" \
    -e "s/{{ ipAddress }}/${ipAddress}/g" \
    -e "s/{{ domainName }}/${domainName}/g" \
    -e "s/{{ port }}/${port}/g" \
    "$deploy_input_file" | sudo tee "config/$deploy_output_file" >/dev/null

  sudo chmod 644 "config/$deploy_output_file" # Ensure the file has the correct permissions after creation

  if [ -f "$dockerfile_output_file" ]; then
    rm -rf "$dockerfile_output_file"
  fi

  sed -e "s/{{ port }}/${username}/g" \
    "$dockerfile_input_file" >"$dockerfile_output_file"

  echo -e "${GREEN}Generated configuration: ${dockerfile_output_file}${NC}"
  echo -e "${GREEN}Generated configuration: ${deploy_output_file}${NC}"
}
