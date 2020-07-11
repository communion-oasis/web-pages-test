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