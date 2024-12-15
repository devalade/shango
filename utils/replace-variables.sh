source $HOME/.local/utils/global-variables.sh

replace_variables() {
  local template_path="$1"
  local username="${2:-}"
  local appName="${3:-}"
  local ipAddress="${4:-}"
  local port="${5:-3000}"

  local deploy_input_file="$template_path/deploy.yml.stub"
  local deploy_output_file="deploy.yml"

  local dockerfile_input_file="$template_path/Dockerfile.stub"
  local dockerfile_output_file="Dockerfile"

  mkdir -p config # Create the folder (if it doesn't exist)

  sed -e "s/{{ username }}/${username}/g" \
    -e "s/{{ appName }}/${appName}/g" \
    -e "s/{{ ipAddress }}/${ipAddress}/g" \
    -e "s/{{ port }}/${port}/g" \
    "$deploy_input_file" >"config/$deploy_output_file"

  sed -e "s/{{ port }}/${username}/g" \
    "$dockerfile_input_file" >"$dockerfile_output_file"

  echo -e "${GREEN}Generated configuration: ${dockerfile_output_file}${NC}"
  echo -e "${GREEN}Generated configuration: ${deploy_output_file}${NC}"
}
