#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

function rsyncFiles() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~;
    source ~/.bash_profile;
}

function createLinks() {
    for file in $(find . -maxdepth 1 ! \( \
        -name ".DS_Store" -or -name "bootstrap.sh" -or \
        -name ".git" -or -name ".idea" -or \
        -name "README.md" -or -name "LICENSE-MIT.txt" \));
    do
        file=${file#./}
        echo "linking $(pwd)/${file} to ${HOME}/${file}"
        ln -sF "$(pwd)/${file}" "${HOME}/${file}";
    done
    source ~/.bash_profile;
}

#if [ "$1" == "--force" -o "$1" == "-f" ]; then
#    doIt;
#else
#    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
#    echo "";
#    if [[ $REPLY =~ ^[Yy]$ ]]; then
#        doIt;
#    fi;
#fi;

createLinks;
unset createLinks
unset rsyncFiles;
