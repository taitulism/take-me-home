# take-me-home
My .dotfiles and more


Install Stuff
-------------
* `$ git clone git@github.com:taitulism/take-me-home.git`
* `$ source take-me-home.sh`


.inputrc
--------
* Press `ESC` twice to clear the input buffer (command line)
* Use `shift+tab` to cycle through completion options


Aliases
-------
* cd- = `'cd -'` cd to last directory
* cd.. = `'cd ..'`
* .. = `cd ..`
* ... = `cd ../../`
* .... = `cd ../../../`
* ..... = `cd ../../../../`
* mkdir = `mkdir -pv`
* cls = `clear`
* ls = `ls --color=auto -AXF --group-directories-first`
* lsl = `ls -1`
* ll = `ls -AlF --group-directories-first --human-readable`
* lls = `ll | less`
* rm = `rm -I --preserve-root`
* chown = `chown --preserve-root`
* chmod = `chmod --preserve-root`
* chgrp = `chgrp --preserve-root`
* grep = `grep --color=auto`
* debi = `sudo dpkg -i`
* upgrade = `sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove`


Function Aliases
----------------
* `mkcd` = mkdir and cd into it
* `nsh` = create a new shell script with a shebang. For example:  
```sh
$ nsh qwe  # creates "qwe.sh"
```
* `hs` = history helper tool to show only last N commands. For example:  
```sh
$ hs 5      # show last 5 cmds
$ hs git    # show all git cmds
$ hs git 5  # show all git cmds from last 5
```


Git Aliases
-----------
* l = `git log --graph --pretty=format:'%Cred%h - %Cgreen%s %C(cyan)(%ar)' -20`
* f = `git fetch`
* p = `push`
* pf = `push --force`
* pl = `pull`
* plf = `pull --force`
* st = `git status`
* sts = `git status --short`
* sta = `git status --untracked-files` - show all new files inside a new directory
* aa = `git add --all`
* au = `git add --update`
* ch = `git checkout`
* ch- = `git checkout -`
* chm = `git checkout master`
* chd = `git checkout develop`
* chs = `git checkout staging`
* com = `git commit`
* come = `git commit --amend`
* coma = `git commit -a`
* cae = `git commit -a --amend`
* cm = `git commit -m`
* cme = `git commit --amend -m`
* cam = `git commit -am`
* came = `git commit --amend -am`
* br = `git branch`
* bra = `git branch --all` - show remote branches too
* dbr = `git branch -D`
* dbrr = `git push origin --delete` - delete remote branch
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


git-prompt
----------
Workflow example:  
![workflow example](https://raw.githubusercontent.com/taitulism/take-me-home/master/images/workflow-example.png)

A conflict:  
![conflict example](https://raw.githubusercontent.com/taitulism/take-me-home/master/images/conflict-example.png)
