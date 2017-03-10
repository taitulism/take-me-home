#!/bin/bash

_red_bg=$(createColor black red 0)

# symbols
V="\u2714"
X="\u2716"
PLUS="\u2795"
QUESTION="\u2753"
PROMPT_ARROW="\u27A4"
EXCLAMATION="\u2757"
ARROW_LEFT="\u21B6"
ARROW_RIGHT="\u21B7"
TWO_ARROWS="\u21C5"

# parsed symbols
SYMB_CLEAN="$V"
SYMB_CONFLICT="$X"
SYMB_STAGED="$PLUS"
SYMB_CHANGED="$EXCLAMATION"
SYMB_NEWFILES="$QUESTION"
SYMB_AHEAD="$ARROW_RIGHT"
SYMB_BEHIND="$ARROW_LEFT"
SYMB_DIVERGED="$TWO_ARROWS"

isGitRepository () {
    git rev-parse --is-inside-work-tree >& /dev/null
    echo $?
}

gitBranch () {
    if [ $(isGitRepository) = 0 ] ; then
        local statusText=`git status`
        local branchName=`git rev-parse --abbrev-ref HEAD`
        local branchStatus=""

        if [ $(isClean) = "0" ] ; then
            if [ $(isAhead) = "0" ] ; then
                branchStatus="$SYMB_AHEAD "
            elif [ $(isBehind) = "0" ] ; then
                branchStatus="$SYMB_BEHIND "
            elif [ $(hasDiverged) = "0" ] ; then
                branchStatus="$SYMB_DIVERGED "
            fi

            echo "[$branchName $SYMB_CLEAN $branchStatus]"
            return
        fi


        if [ $(hasConflicts) = "0" ] ; then
            echo "[$(paint $_red_bg $branchName $SYMB_CONFLICT)]"
            return
        fi


        if [ $(hasStaged) = "0" ] ; then
            branchStatus="$(paintGreen $SYMB_STAGED) "
        fi

        if [ $(hasChanges) = "0" ] ; then
            branchStatus="$branchStatus$(paintYellow $SYMB_CHANGED)"
        fi

        if [ $(hasNewFiles) = "0" ] ; then
            branchStatus="$branchStatus$(paintRed $SYMB_NEWFILES) "
        fi

        echo "[$branchName $branchStatus]"
    else
        echo ''
    fi
}

isCleanIndicator="nothing to commit"
isClean () {
    _isClean=`echo $statusText | grep -c "$isCleanIndicator"`

    if [ "$_isClean" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

isAheadIndicator="branch is ahead"
isAhead () {
    _isAhead=`echo $statusText | grep -c "$isAheadIndicator"`

    if [ "$_isAhead" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

isBehindIndicator="branch is behind"
isBehind () {
    _isBehind=`echo $statusText | grep -c "$isBehindIndicator"`

    if [ "$_isBehind" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasDivergedIndicator="have diverged"
hasDiverged () {
    _hasDiverged=`echo $statusText | grep -c "$hasDivergedIndicator"`

    if [ "$_hasDiverged" == "1" ] ; then
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

YELLOW=$'\e[1;33m'
BLUE=$'\e[0;34m'
RST_CLR=$'\e[0m' # Reset Color
PROMPT_ARROW=$'\u27A4'

export PS1=$'\n[\[$BLUE\]\w\[$RST_CLR\]]$(gitBranch)\n\[$YELLOW\]$PROMPT_ARROW\[$RST_CLR\]  '
