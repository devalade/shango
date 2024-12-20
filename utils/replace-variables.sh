#!/bin/bash

replace_variables() {
  local template_path="$1"
  local username="$2"
  local appName="$3"
  local domainName="$4"
  local ipAddress="$5"
  local port="${6:-3000}"
  local selected_database="${7:-No Database}"
  local cached_database="${8:-No Cache}"

  # Create temporary files
  local temp_file=$(mktemp)
  local final_file="config/deploy.yml"

  # Start with base configuration
  cat "$template_path/base/deploy.yml.stub" >"$temp_file"

  # Add database configuration if selected
  if [ "$selected_database" != "No Database" ]; then
    yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' \
      "$temp_file" "$template_path/databases/${selected_database,,}.yml.stub" >"$temp_file.new"
    mv "$temp_file.new" "$temp_file"
  fi

  # Add cache configuration if selected
  if [ "$cached_database" != "No Cache" ]; then
    yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' \
      "$temp_file" "$template_path/cache/${cached_database,,}.yml.stub" >"$temp_file.new"
    mv "$temp_file.new" "$temp_file"
  fi

  # Replace variables in the combined file
  sed -i \
    -e "s|{{ username }}|$username|g" \
    -e "s|{{ appName }}|$appName|g" \
    -e "s|{{ domainName }}|$domainName|g" \
    -e "s|{{ ipAddress }}|$ipAddress|g" \
    -e "s|{{ port }}|$port|g" \
    "$temp_file"

  # Move to final location
  mkdir -p config
  mv "$temp_file" "$final_file"

  # Handle Dockerfile - now using a single template
  sed -e "s|{{ port }}|$port|g" \
    "$template_path/base/Dockerfile.stub" >"Dockerfile"

  # Set appropriate permissions
  chmod 644 "config/deploy.yml" "Dockerfile"

  echo "✨ Generated deploy.yml and Dockerfile for your ${selected_database} project"
}
