# Ansible Role: Oh My Zsh Setup

This Ansible role is designed to set up Oh My Zsh as the default shell environment for users, specifically installing and configuring Zsh with the Powerlevel10k theme, zsh-autosuggestions, and zsh-syntax-highlighting plugins.

## Features

- Installs Zsh and sets it as the default shell.
- Clones and configures the Powerlevel10k theme for a rich, customizable Zsh experience.
- Adds zsh-autosuggestions and zsh-syntax-highlighting for enhanced command-line productivity.
- Copies custom Zsh configuration files for immediate use.
- Configures both the `node` and `root` users with the new shell settings. 

## Requirements

- Target systems should be based on Debian or Ubuntu (due to the use of the `apt` module).
- Ansible 2.9 or higher.
- SSH access to the target machines.
- Sudo privileges on the target machines.

## Role Variables

This role uses the following variables (found in `vars/main.yml`):

- `powerlevel10k_repo`: URL to the Powerlevel10k Git repository.
- `zsh_autosuggestions_repo`: URL to the zsh-autosuggestions Git repository.
- `zsh_syntax_highlighting_repo`: URL to the zsh-syntax-highlighting Git repository.

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

This project is licensed under [MIT](./LICENSE)

## Author Information

This role was created in 2024 by [chrisurf](https://chrisurf.com).