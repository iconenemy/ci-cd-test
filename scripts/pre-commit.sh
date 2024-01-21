#!/bin/bash

echo "=============================================================================================================="
echo "Checking branch name..."

BRANCH=$(git symbolic-ref --short HEAD)
PATTERN="^(feature|bug|refactoring|hotfix|develop|main)\/[a-z0-9-]+$"

if [[ ! $BRANCH =~ $PATTERN ]]; then
  echo "
  There is something wrong with your branch name.
  Branch name in this project must adhere to this contract:
  feature|bug|refactoring|hotfix|develop|main: Test commit message

  Your branch: $BRANCH
  "
  exit 1
fi

echo "Success!"