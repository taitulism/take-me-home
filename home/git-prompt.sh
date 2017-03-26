#!/bin/bash

_red_bg=$(createColor black red 0)

YELLOW=$'\e[1;33m'
BLUE=$'\e[0;34m'
RST_CLR=$'\e[0m' # Reset Color

# symbols
V="\u2714"
X="\u2716"
PLUS="\u2795"
QUESTION="\u2753"
EXCLAMATION="\u2757"
ARROW_LEFT="\u21B6"
ARROW_RIGHT="\u21B7"
TWO_ARROWS="\u21C5"
PROMPT_ARROW=$'\u27A4'

isGitRepository () {
    git rev-parse --is-inside-work-tree &> /dev/null
    echo 0
}

getBranchName () {
    local branchName=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if [ "$branchName" = 'HEAD' ] ; then
        branchName='<BRANCH>'
    fi

    echo $branchName
}

gitBranch () {
    if [ $(isGitRepository) = 0 ] ; then
        local statusText=`git status 2> /dev/null`
        local branchName=$(getBranchName)
        local backSpace=''

        if [ $(hasConflicts) = "0" ] ; then
            echo -e "[$(paint $_red_bg $branchName "$X ")]"
            return
        fi

        local branchStatus=''

        if [ $(isClean) = "0" ] ; then
            branchStatus+="$V"
        else
            if [ $(hasStaged) = "0" ] ; then
                branchStatus+="$(paintGreen "$PLUS") "
                backSpace='\b'
            fi

            if [ $(hasChanges) = "0" ] ; then
                branchStatus+="$(paintYellow "$EXCLAMATION")"
                backSpace=''
            fi

            if [ $(hasNewFiles) = "0" ] ; then
                branchStatus+="$(paintRed "$QUESTION")"
                backSpace=''
            fi
        fi

        local originBranch

        if [ $(isAhead) = "0" ] ; then
            originBranch="$ARROW_RIGHT"
        elif [ $(isBehind) = "0" ] ; then
            originBranch="$ARROW_LEFT"
        elif [ $(hasDiverged) = "0" ] ; then
            originBranch="$TWO_ARROWS"
        fi

        echo -e " ${branchStatus} ${backSpace}($branchName) $originBranch"
    fi
}

isCleanIndicator='nothing to commit'
isClean () {
    _isClean=`echo $statusText | grep -c "$isCleanIndicator"`

    if [ "$_isClean" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

isAheadIndicator='branch is ahead'
isAhead () {
    _isAhead=`echo $statusText | grep -c "$isAheadIndicator"`

    if [ "$_isAhead" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

isBehindIndicator='branch is behind'
isBehind () {
    _isBehind=`echo $statusText | grep -c "$isBehindIndicator"`

    if [ "$_isBehind" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasDivergedIndicator='have diverged'
hasDiverged () {
    _hasDiverged=`echo $statusText | grep -c "$hasDivergedIndicator"`

    if [ "$_hasDiverged" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasStagedIndicator='Changes to be committed'
hasStaged () {
    _hasStaged=`echo $statusText | grep -c "$hasStagedIndicator"`

    if [ "$_hasStaged" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasChangesIndicator='Changes not staged for commit'
hasChanges () {
    _hasChanges=`echo $statusText | grep -c "$hasChangesIndicator"`

    if [ "$_hasChanges" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasNewFilesIndicator='Untracked files'
hasNewFiles () {
    _hasNewFiles=`echo $statusText | grep -c "$hasNewFilesIndicator"`

    if [ "$_hasNewFiles" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

hasConflictsIndicator='both modified'
hasConflicts () {
    _hasConflicts=`echo $statusText | grep -c "$hasConflictsIndicator"`

    if [ "$_hasConflicts" == "1" ] ; then
        echo 0
    else
        echo 1
    fi
}

export PS1='\n[\[$BLUE\]\w\[$RST_CLR\]]$(gitBranch)\n\[$YELLOW\]$PROMPT_ARROW\[$RST_CLR\]  '
