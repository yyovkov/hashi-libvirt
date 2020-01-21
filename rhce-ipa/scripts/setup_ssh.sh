#!/bin/bash -eux

VAGRANT_INSECURE_KEY='ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key'

echo '==> Turning off sshd DNS lookup to prevent timeout delay'
echo "UseDNS no" >> /etc/ssh/sshd_config
echo '==> Disablng GSSAPI authentication to prevent timeout delay'
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

echo '==> Installing Vagrant Unsecure SSH Key'
mkdir -pm 700 /home/vagrant/.ssh
echo "${VAGRANT_INSECURE_KEY}" > /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
