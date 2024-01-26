# Vagrant Ansible Test Runtime

This vagrant environment services for testing purposies of the ansible role.

## Prerequisites

  * Virtualbox is installed
  * Vagrant is installed
  * vagrant up will install vagrant-hostmanager module

## Test process

```
cd vagrant
vagrant up
```

The vagrant role will be applied automatically during the vagrant up process.

### Test with molecule from inside vagrant

```
vagrant ssh
cd /etc/ansible/roles/chrisurf.oh_my_zsh/
yamllint .
ansible-lint .
molecule test --all
```

### Test the installation

The prompt within your terminal shall use the Powerlevel10k theme.
