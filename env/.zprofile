if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add ~/Desktop/Documents/keys/hiversp.ssh
fi
