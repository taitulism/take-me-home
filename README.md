# take-me-home
My .dotfiles and more

Install Stuff
-------------
* `$ sudo apt-get install silversearcher-ag`


Aliases
-------
* cdh = `'cd ~'` - cd home
* cd- = `'cd -'` cd to last directory
* .. = `cd ..`
* ... = `cd ../../`
* .... = `cd ../../../`
* ..... = `cd ../../../../`
* mkdir = `mkdir -pv`
* cls = `clear`
* h = `history`
* ls = `ls --color=auto -AXF --group-directories-first`
* ls1 = `ls -1`
* ll = `ls -AlF --group-directories-first --human-readable`
* lll = `ll | less`
* rm = `rm -I --preserve-root`
* chown = `chown --preserve-root`
* chmod = `chmod --preserve-root`
* chgrp = `chgrp --preserve-root`
* upgrade = `sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove`


Function Aliases
----------------
* `hs` = history helper tool to show only last N commands. For example: `hs -5`
* `mkcd` = mkdir and cd into it


Git Aliases
-----------
* l = `git log --graph --pretty=format:'%Cred%h - %Cgreen%s %C(cyan)(%ar)' -20`
* f = `git fetch`
* st = `git status`
* sts = `git status --short`
* sta = `git status --untracked-files` - show the new files inside a new directory
* aa = `git add --all`
* au = `git add --update`
* ch = `git checkout`
* chm = `git checkout master`
* chd = `git checkout develop`
* chs = `git checkout staging`
* com = `git commit`
* cm = `git commit -m`
* cam = `git commit -am`
* br = `git branch`
* wbr = `git rev-parse --abbrev-ref HEAD`
* dbr = `git branch -D`
* nbr = `git checkout -b`
* brm = `git branch --merged`
* brnm = `git branch --no-merge`
* ms = `git merge --squash`
* hr = `git reset --hard`
* df = `git diff`
* dfh = `git diff HEAD`
* df1 = `git diff HEAD~1`
* df2 = `git diff HEAD~2`
* df3 = `git diff HEAD~3`
* dfw = `git diff --word-diff`
* dfwh = `git diff --word-diff HEAD`
* save = `git stash save`
* list = `git stash list`
* restore = `git stash pop`
* del = `git stash clear`