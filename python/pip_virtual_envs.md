
## Pip config file : https://pip.pypa.io/en/stable/user_guide/#configuration

Per user :
- Unix : $HOME/.config/pip/pip.conf
- Mac : "$HOME/Library/Application Support/pip/pip.conf" (or $HOME/.config/pip/pip.conf)
- Windows : %APPDATA%\pip\pip.ini

Virtualenv :
- Unix & mac : $VIRTUAL_ENV/pip.conf
- Windows : %VIRTUAL_ENV%\pip.ini

Pyenv :
- Afficher les version de python que l'on peut installer : pyenv install -l
- Installer une version de python : pyenv install 3.6.1
- Creer un virtual env : pyenv virtualenv 3.6.1 virtual_env_name_3.6.1
- Activation : pyenv local virtual_env_name_3.6.1
- Activation auto du virtualenv : ajouter dans le .bashrc :
    if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
