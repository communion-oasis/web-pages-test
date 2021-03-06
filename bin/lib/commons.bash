function getCurrentBranch
{
    git symbolic-ref --short HEAD
}

function isSaveable
{
    [[ ! -z "$(git status -s)" ]]
}

function isRequestingHelp
{
    [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]
}

function hasAtLeastOneArgument
{
    [[ "$#" != "0" ]]
}

function hasMoreThanOneArgument
{
    [[ "$#" != "0" ]] && [[ "$#" != "1" ]]
}

function doesBranchExist
{
    local BRANCH_NAME="$1"
    [[ ! -z "$(git branch --list "$BRANCH_NAME")" ]]
}

function getLastCommitMessage
{
    local BRANCH_NAME="$1"
    doesBranchExist "$BRANCH_NAME"
    [[ "$?" == "0" ]] && git log -1  --pretty='%s' "$BRANCH_NAME"
}

function getProjectName
{
    [[ "$(git remote get-url origin)" =~ [:\/]([^:\/\.]+)(\.git)?$ ]] && echo "${BASH_REMATCH[1]}"
}

function getRandomKey
{
    head /dev/urandom | tr -dc a-zA-Z0-9 | head -c 13
    echo ""
}