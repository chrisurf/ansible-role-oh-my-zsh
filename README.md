# Ansible Role: Oh My Zsh Setup

This Ansible role is designed to install and set up Oh My Zsh as the default shell environment for users, specifically installing and configuring Oh My Zsh with the Powerlevel10k theme, zsh-autosuggestions, and zsh-syntax-highlighting plugins.

## Features

- Installs Oh My Zsh and sets it as the default shell.
- Clones and configures the Powerlevel10k theme for a rich, customizable Oh My Zsh experience.
- Adds zsh-autosuggestions and zsh-syntax-highlighting for enhanced command-line productivity.
- Copies custom Zsh and Powerlevel10k configuration files for immediate use.
- Configures both the `root` and `{CUSTOM}` users with the new shell settings.

## Requirements

- Target systems should be based on Debian or Ubuntu (due to the use of the `apt` module).
- Ansible 2.11 or higher.
- SSH access to the target machines.
- Sudo privileges on the target machines.

## Role Variables

This role uses the following variables (found in `defaults/main.yml`):

- `user`: **(Optional)** A custom system user of your choice.

## Files

- `.p10k.zsh`: Custom configuration file for Powerlevel10k.
- `.zshrc`: Custom Zsh configuration file.

These files should be placed in the `files` directory of the role.

## Installation

To install this role, run the following command.

```sh
ansible-galaxy role install chrisurf.oh_my_zsh
```

## Usage

To use this role, include it in your playbook. Below is an example playbook:

```yaml
- hosts: localhost
  roles:
    - chrisurf.oh_my_zsh
```

> **Note**: Ensure your inventory is set up correctly to target the desired hosts.

## License

This project is licensed under [MIT](https://github.com/chrisurf/ansible-role-oh-my-zsh/blob/main/LICENSE)

## Author Information

This role was created in 2024 by [chrisurf](https://chrisurf.com).
