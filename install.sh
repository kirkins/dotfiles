sudo puppet module install puppetlabs/stdlib
cp -rf .puppet ~/
sudo puppet apply --modulepath=/home/$USER/.puppet/modules /home/$USER/.puppet/manifests/dev.pp
