#!/usr/bin/env bash
set -euo pipefail

echo "Running ansible-lint..."
ansible-lint ansible

echo "Running yamllint..."
yamllint ansible

echo "Running molecule tests..."
for role in ansible/roles/*; do
  if [ -d "$role/molecule" ]; then
    echo "Testing role: $role"
    (cd "$role" && molecule test)
  fi
done

