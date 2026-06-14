#!/usr/bin/env bash
#
# Dev container provisioning: install Ansible, pull the oh-my-zsh role from
# Ansible Galaxy and apply it to the current (vscode) user.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# The python feature provides pip; install a recent ansible-core.
pip install --user --quiet "ansible-core>=2.16"
export PATH="${HOME}/.local/bin:${PATH}"

# Install the role from Ansible Galaxy.
ansible-galaxy role install chrisurf.oh_my_zsh

# Apply it. The role's become tasks use the vscode user's passwordless sudo.
ansible-playbook "${script_dir}/playbook.yml"
