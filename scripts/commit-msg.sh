#!/bin/bash

echo "=============================================================================================================="
echo "Checking commit name..."

COMMIT_MSG=$(git log -1 --pretty=format:"%s"  $*)
PATTERN="^(feat|bug|ref|fix):[[:space:]][A-Z]+[a-z[:space:]]+$"

if [[ ! $COMMIT_MSG =~ $PATTERN ]]; then
  echo "
  There is something wrong with your commit message.
  Commit messages in this project must adhere to this contract:
  feat|bug|ref|fix: Test commit message
  First later after feat|bug|ref should be CAPITAL and with a space sign before
  
  Your commit message: $COMMIT_MSG
  "
  exit 1
fi

echo "Success!"