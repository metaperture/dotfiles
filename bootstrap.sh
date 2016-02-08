
# install conda
curl -L --proxy-negotiate -U : -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ./Miniconda3-latest-Linux-x86_64.sh -b -p "$HOME/.miniconda" # in batch mode: install to $HOME/.miniconda3
rm ./Miniconda3-latest-Linux-x86_64.sh
export PATH=$HOME/.miniconda/bin/:$PATH
bash -e "$CMDPREFIX pip install dotfiles" # CMDPREFIX might = gssproxy2 -e
THISDIR=$(readlink -f $(dirname $0))
cp $THISDIR/dotfilesrc ~/.dotfilesrc
dotfiles --sync --force
