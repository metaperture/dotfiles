# dotfiles

using https://pypi.python.org/pypi/dotfiles

Set proxy env vars, and $CMDPREFIX if it's needed for proxy reasons, then install with:

```
eval "$CMDPREFIX git clone --recursive http://github.com/metaperture/dotfiles .dotfiles && source ./.dotfiles/bootstrap.sh"
```
Might also need the following in certain envs:

```
conda config --set ssl_verify false
```
