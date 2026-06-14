# Ansible Role: Oh My Zsh Setup

This Ansible role is designed to install and set up Oh My Zsh as the default shell environment for users, specifically installing and configuring Oh My Zsh with the Powerlevel10k theme, zsh-autosuggestions, and zsh-syntax-highlighting plugins.

## Features

- Installs Oh My Zsh and sets it as the default shell.
- Works across Debian/Ubuntu and RedHat/Rocky based distributions.
- Clones and configures the Powerlevel10k theme for a rich, customizable Oh My Zsh experience.
- Adds zsh-autosuggestions and zsh-syntax-highlighting for enhanced command-line productivity.
- Copies custom Zsh and Powerlevel10k configuration files for immediate use.
- Configures both the `root` and `{CUSTOM}` users with the new shell settings.

## Requirements

- Target systems must be **Debian/Ubuntu** or **RedHat/Rocky** based. The role
  uses the generic `package` module and fails fast on unsupported distributions.
- Ansible 2.12 or higher.
- SSH access to the target machines.
- Sudo privileges on the target machines.
- Outbound network access to GitHub (the theme and plugins are cloned from there).

## Role Variables

This role uses the following variables (found in `defaults/main.yml`):

| Variable | Default | Description |
| --- | --- | --- |
| `omz_user` | `root` | System user that Oh My Zsh is installed and configured for. |
| `omz_p10k_version` | `v1.20.0` | Git ref (tag/branch/commit) of the Powerlevel10k theme. |
| `omz_autosuggestions_version` | `v0.7.1` | Git ref of the `zsh-autosuggestions` plugin. |
| `omz_syntax_highlighting_version` | `0.8.0` | Git ref of the `zsh-syntax-highlighting` plugin. |

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

To configure Oh My Zsh for a non-root user, override `omz_user`:

```yaml
- hosts: workstations
  become: true
  roles:
    - role: chrisurf.oh_my_zsh
      vars:
        omz_user: alice
```

> **Note**: Ensure your inventory is set up correctly to target the desired hosts.

## Testing

This role is tested with [Molecule](https://ansible.readthedocs.io/projects/molecule/)
using the Docker driver. Linting and the test suite run automatically in CI on
every push and pull request, across multiple distributions:

- Ubuntu 22.04 (`ubuntu2204`) and 20.04 (`ubuntu2004`)
- Debian 12 (`debian12`) and 11 (`debian11`)
- Rocky Linux 9 (`rockylinux9`) and 8 (`rockylinux8`)

To run the tests locally:

```sh
pip install "molecule>=6" "molecule-plugins[docker]" ansible-core docker yamllint ansible-lint

# Lint
yamllint .
ansible-lint

# Full converge + idempotence + verify cycle (defaults to Ubuntu 22.04)
molecule test

# Test against another distribution
MOLECULE_DISTRO=rockylinux9 molecule test
```

## License

This project is licensed under [MIT](https://github.com/chrisurf/ansible-role-oh-my-zsh/blob/main/LICENSE)

## Author Information

This role was created in 2024 by [chrisurf](https://chrisurf.com).
