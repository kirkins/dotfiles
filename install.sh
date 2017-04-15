PUPPET_CMD=$(which puppet)

# check if puppet is installed
if [[ -z $PUPPET_CMD ]]; then
  # if puppet isn't installed check for ruby gems
  GEM_CMD=$(which gem)
  if [[ -z $GEM_CMD ]]; then
    # if no ruby gems install it & ruby
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
  fi

  # install puppet with ruby gems
  sudo gem install puppet
fi

# install stdlib from puppetlabs
sudo puppet module install puppetlabs/stdlib
# move puppet files
cp -rf .puppet ~/
# apply puppet setup
sudo puppet apply --modulepath=/home/$USER/.puppet/modules /home/$USER/.puppet/manifests/dev.pp
