function gpgkeyreinit
    killall gpg-agent scdaemon 2>| rg --invert-match 'no process found'
    gpg-connect-agent reloadagent updatestartuptty /bye >/dev/null
    set -e GPG_TTY; set -x --universal GPG_TTY (tty)
    set -e SSH_AUTH_SOCK; set -x --universal SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end
