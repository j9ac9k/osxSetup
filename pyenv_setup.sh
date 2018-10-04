#!/usr/bin/env bash

pip install --upgrade pip
pip install virtualenv virtualenvwrapper

# adding pyenv update plugins
git clone git://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
gitup --add $(pyenv root)/plugins/pyenv-update

# getting conda hooks in
mkdir /usr/local/var/pyenv.d/virtualenv
cp ./venv_hook.bash /usr/local/var/pyenv.d/virtualenv/

# base python environments
pyenv install miniconda3-latest
pyenv install 2.7.15
pyenv install 3.7.0
pyenv install 3.6.6

# creating virtual environments
pyenv virtualenv 2.7.15 neovim2
pyenv virtualenv 3.7.0 neovim3
pyenv virtualenv 3.7.0 tools
pyenv virtualenv miniconda3-latest main

# pre-populating virtual environments
"$WORKON_HOME"/neovim2/bin/pip install -y neovim

"$WORKON_HOME"/neovim3/bin/pip install -y neovim numpydoc

"$WORKON_HOME"/tools/bin/pip install -y powerline-status requests twine pylint ipython flake8 flake8-mypy

"$WORKON_HOME"/main/bin/conda install -y scipy pandas statsmodels matplotlib seaborn ipython scikit-learn
