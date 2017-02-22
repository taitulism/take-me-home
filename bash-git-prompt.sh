#!/bin/bash

# clean = white V
# staged = green + 
# tracked (modified) = red
# tracked and staged = red
# untracked = ?
# conflict = red background

# ahead/behind = white <>

# colors
RED=$'\033[0;31m'
RED_BG=$'\033[31;7m' 
GREEN=$'\033[0;32m'
YELLOW=$'\033[1;33m'
RST_CLR=$'\033[0m' # Reset Color

isGitRepository () {
    git rev-parse --is-inside-work-tree >& /dev/null
    echo $?
}

gitBranch () {
    if [ $(isGitRepository) = 0 ] ; then
        local branchName=`git rev-parse --abbrev-ref HEAD`
        local statusText=`git status`

        if [ $(isClean) = "0" ] ; then
            echo -e " (\u2714 $branchName)"
            return
        fi

        if [ $(hasConflicts) = "0" ] ; then
            echo -e " ($RED_BG\u2716 $branchName$RST_CLR)"
            return
        fi

        if [ $(hasNewFiles) = "0" ] ; then
            branchName="$RED\u2753$RST_CLR $branchName"
        fi

        if [ $(hasChanges) = "0" ] ; then
            echo -e " ($RED$branchName$RST_CLR)"
            return
        fi

        if [ $(hasStaged) = "0" ] ; then
            echo -e " ($GREEN\u271A$RST_CLR $branchName)"
            return
        fi

        echo -e " ($branchName)"
    else
        echo ''
    fi
}

isCleanIndicator="working directory clean"
isClean () {
    _isClean=`echo $statusText | grep -c "$isCleanIndicator"`

    if [ "$_isClean" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasStagedIndicator="Changes to be committed"
hasStaged () {
    _hasStaged=`echo $statusText | grep -c "$hasStagedIndicator"`

    if [ "$_hasStaged" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasChangesIndicator="Changes not staged for commit"
hasChanges () {
    _hasChanges=`echo $statusText | grep -c "$hasChangesIndicator"`

    if [ "$_hasChanges" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasNewFilesIndicator="Untracked files"
hasNewFiles () {
    _hasNewFiles=`echo $statusText | grep -c "$hasNewFilesIndicator"`

    if [ "$_hasNewFiles" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasConflictsIndicator="both modified"
hasConflicts () {
    _hasConflicts=`echo $statusText | grep -c "$hasConflictsIndicator"`

    if [ "$_hasConflicts" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

export PS1=$'\[$YELLOW\]\w\[$RST_CLR\]$(gitBranch) \[$YELLOW\]\$\[$RST_CLR\] '
# export PS1=$'\w $(gitBranch)\\[\e[31m\\]\u2713\\[\e[0m\\] '
