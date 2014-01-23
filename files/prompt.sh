# Managed by puppet.

# set red prompt for root, otherwise nice green one
if [ $UID -eq 0  -o $EUID -eq 0 ]
then
  PS1='[\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]]# '
else
  PS1='[\u@\h \[\033[01;34m\]\W\[\033[00m\]]# '
fi
