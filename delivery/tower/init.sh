#!/usr/bin/env sh

set -ex

vagrant init tower http://vms.ansible.com/ansible-tower-2.1.4-virtualbox.box
vagrant up