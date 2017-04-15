# dotfiles
Bash script with puppet to configure my development environment

## includes

### Programs with custom dotfiles:

*  tmux      # background bash windows
*  vim       # text editor
*  i3        # window manager

### Additional programs:

* jq         # formatting json
* gimp       # image editing
* git        # version control
* nmap       # port scanning
* virtualenv # manage python dependencies
* python-pip # python pakcage management

### Programs from github:
* vundle     # handle vim plugins

### Vim plugins
* rodjek/vim-puppet # syntax highlighting for puppet files

## usage

    git clone --recursive http://github.com/kirkins/dotfiles
    cd dotfiles
    ./install.sh
