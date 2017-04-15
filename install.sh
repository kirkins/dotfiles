# install ruby & ruby gems using system package manager

YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt-get)
PACMAN_CMD=$(which pacman)

if [[ ! -z $YUM_CMD ]]; then
  sudo yum install ruby rubygems
elif [[ ! -z $APT_GET_CMD ]]; then
  sudo apt-get update
  sudo apt-get install ruby rubygems
elif [[ ! -z $PACMAN_CMD ]]; then
  sudo pacman -Syu ruby rubygems
else
  echo "System package manager not found."
  exit 1;
fi

# install puppet
sudo gem install puppet
# install stdlib from puppetlabs
sudo puppet module install puppetlabs/stdlib
# move puppet files
cp -rf .puppet ~/
# apply puppet setup
sudo puppet apply --modulepath=/home/$USER/.puppet/modules /home/$USER/.puppet/manifests/dev.pp
