alias cpuinfo='sysctl -n machdep.cpu'
alias pip-clean='pip freeze --exclude-editable | grep -v "pip-tools" | xargs pip uninstall -y'
alias top='top -u'

alias grep='grep --color=always'
export GREP_COLOR='1;35;40'

alias clean_docker_img='docker rmi $(docker images -f "dangling=true" -q)'

