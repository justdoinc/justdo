#!/usr/bin/env bash

shopt -s extglob

SCRIPT_DIR="$(dirname ${BASH_SOURCE[0]})"
OUTPUT_DIR="$SCRIPT_DIR/output"
LANDING_APP_REL_DIR="justdo-landing-app-ce"
WEB_APP_REL_DIR="justdo-web-app-ce"

# Ensure that all git repositories are clean
REPO_PATHS_TO_CHECK_FOR_CLEAN_GIT_REP=(
    "$MAIN_DIR"
    "$MAIN_DIR/$LANDING_APP_DIR"
    "$MAIN_DIR/$WEB_APP_DIR"
)
# for repo_path in "${REPO_PATHS_TO_CHECK_FOR_CLEAN_GIT_REP[@]}"; do
#   pushd "$repo_path"
#     if ! isCleanGitRep; then
#       announceErrorAndExit "Git repository at $repo_path isn't clean. Please commit all changes and try $self again"
#     fi
#   popd
# done

# rm -rf "$OUTPUT_DIR"
mkdir -p $OUTPUT_DIR

rsync -av --exclude 'output' --exclude 'node_modules' --exclude '.DS_Store' --exclude '.meteor' --exclude '.npm' "$MAIN_DIR/" "$OUTPUT_DIR"

APP_REPO_DIRS=(
    "$LANDING_APP_REL_DIR"
    "$WEB_APP_REL_DIR"
)
for repo_path in "${APP_REPO_DIRS[@]}"; do
  # Copy .meteor folder
  source_app_application_path="$MAIN_DIR/$repo_path/application"
  dest_app_application_path="$OUTPUT_DIR/$repo_path/application"

  mkdir -p "$dest_app_application_path/.meteor"
  cp -r $source_app_application_path/.meteor/!(\.|\.\.|local|\.id) "$dest_app_application_path/.meteor"

  # Create the .meteor/.id file
  cat > "$dest_app_application_path/.meteor/.id" <<EOF 
# This file contains a token that is unique to your project.
# Check it into your repository along with the rest of this directory.
# It can be used for purposes such as:
#   - ensuring you don't accidentally deploy one app on top of another
#   - providing package authors with aggregated statistics

$(cat /dev/urandom | LC_CTYPE=C platformTr -dc 'a-z0-9' | fold -w 19 | head -n 1)
EOF

done

cd "$SCRIPT_DIR"
docker build -t "justdo" --platform "linux/amd64" .
