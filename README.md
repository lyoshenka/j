# j

the simplest journal

store journal entries in markdown files, one file per day. edit with your favorite editor. auto-backup to git.

## Install

    curl https://raw.githubusercontent.com/lyoshenka/j/master/j
    chmod +x j
    sudo mv j /usr/local/bin/

## Use

    j

## Enable git backup (aka revision history)

    (mkdir -p ~/.journal && cd ~/.journal && git init)
