# isClean = green
# yellow = staged but not commited
# red = tracked but not staged
# purple = new untracked files
# blink red = both modified (conflict)

# colors
RED='\033[0;31m'
RED_BG='\033[31;7m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RST_CLR='\033[0m' # Reset Color

cd ./folder/place1/aa
# git status

branch=`git rev-parse --abbrev-ref HEAD`
statusText=`git status`
finalBranch=${finalBranch}' ?'
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-# 
# grep -c for --count (returns the number of matches)
# isClean=`echo $statusText | grep -c "working directory clean"`
# hasConflict=`echo $statusText | grep -c "both modified"`
# hasChanges=`echo $statusText | grep -c "Changes not staged for commit"`
# hasNewFiles=`echo $statusText | grep -c "Untracked files"`
# hasStaged=`echo $statusText | grep -c "Changes to be committed"`
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-# 


isClean=`echo $statusText | grep -c "working directory clean"`
hasConflict=`echo $statusText | grep -c "both modified"`
hasChanges=`echo $statusText | grep -c "Changes not staged for commit"`
hasNewFiles=`echo $statusText | grep -c "Untracked files"`
hasStaged=`echo $statusText | grep -c "Changes to be committed"`

parseBranchState () {
    if [ "$isClean" == "1" ]; then
        echo -e "${GREEN}${branch}${RST_CLR}"
    fi

    finalBranch=""
        
    if [ "$hasStaged" == "1" ]; then
        finalBranch="${YELLOW}${branch}${RST_CLR}"
    fi

    if [ "$hasChanges" == "1" ]; then
        finalBranch="${finalBranch} !"
    fi

    if [ "$hasNewFiles" == "1" ]; then
        finalBranch="${finalBranch} ?"
    fi

    if [ "$hasConflict" == "1" ]; then
        finalBranch="${finalBranch} - ${RED_BG}CONFLICT${RST_CLR}"
    fi

    echo -e $finalBranch
}

export PS1="`parseBranchState` $ "


#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-# 
# echo isClean = $isClean         # green
# echo conflict = $conflict       # red bg

# echo hasStaged = $hasStaged     # white _branch_
# echo hasNewFiles = $hasNewFiles # red
# echo hasChanges = $hasChanges   # yellow/orange
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-# 





















#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-# 
# git status | while read line; do
#     if [[ $line =~ "Untracked files" ]]; then
#         echo sababa
#         break
#     else
#         echo lo sababa
#     fi
# done
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-# 

