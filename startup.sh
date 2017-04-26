#! /bin/bash

echo "startup script: `date`" >> ~/.startup.log

source ~/.miniconda/bin/activate std >> ~/.startup.log

if [ ! -f ~/.jupyter/jucert.pem ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/.jupyter/jukey.key -out ~/.jupyter/jucert.pem -subj "/C=US/ST= /L= /O= /OU= /CN= "
fi

if [ ! -f ~/.jupyter/jupyter_notebook_config.py ]; then
    jupyter notebook --generate-config
    #jupyter notebook password
    echo "c.NotebookApp.password = 'sha1:94e19fba64f5:7fd41e3547213995f8e98e148e39a46f803c41a0'" >> ~/.jupyter/jupyter_notebook_config.py
    echo "c.NotebookApp.certfile = '$HOME/.jupyter/jucert.pem'" >> ~/.jupyter/jupyter_notebook_config.py
    echo "c.NotebookApp.keyfile = '$HOME/.jupyter/jukey.key'" >> ~/.jupyter/jupyter_notebook_config.py
    echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
fi

#jupyter notebook --no-browser --notebook-dir=~/proj --ip=*

tmux new-session -d -s servers
tmux send-keys -t servers "jupyter lab --no-browser --notebook-dir=~/proj" C-m

#tmux new -d -s servers 'jupyter lab --no-browser --notebook-dir=~/proj' attach

