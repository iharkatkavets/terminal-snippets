#!/usr/bin/env bash
# filename: worktree-cleanup
#
# get rid 'worktree' folders which branches doesn't exists 
# This script automatically walks through all wortree folders
# and ask for removing them
#
CUR_DIR=$(pwd)

function pushd {
  command pushd "$@" > /dev/null
}

function popd {
  command popd "$@" > /dev/null
}

function locate_git_tool {                         
  for path in ${PATH//:/ }; do                     
    [ -x "$path/git" ] && echo "$path/git" && break
  done                                             
  echo ""                                          
} # end of function locate_git_tool                

function git_fetch {
  $GIT_TOOL fetch --all
}

function contains_untracked_changes {
  local dir=$1
  pushd "$dir"
  local status="$($GIT_TOOL status --short)"
  popd
  echo "$status"
} # end of function contains_untracked_changes

function is_git_dir {
  local dir="$1"
  pushd "$dir"
  [ -d "$dir" ] && [ -d "$dir/.git" -o -e "$dir/.git" ] 
  popd
} #end of function is_git_dir

function is_dir_exist {
  [ -e "$@" -a -d "$@" ]
} # end of function is_dir_exist

function is_current_dir {
  [ "$CUR_DIR" == "$@" ]
}

function choose {
  local default="$1"
  local prompt="$2"
  local choice_yes="$3"
  local choice_no="$4"
  local answer

  read -p "$prompt" answer
  [ -z "$answer" ] && answer="$default"

  case "$answer" in
    [yY1] ) eval "$choice_yes"
      ;;
    [nN0] ) eval "$choice_no"
      ;;
    *     ) printf "%b" "Unexpected answer '$answer'!" >&2 ;;
  esac
} # end of function choose

function contains_unpushed_commits {
  pushd "$@"
  local output=$(git log @{u}.. -p)
  popd
  echo "$output"
}

function is_upstream_branch_exists {
  local path="$1"
  local branch="$2"
  pushd "$path"
  local output=$(git ls-remote --heads --quiet | grep 'branch')
  popd
  echo "$output"
}

function cleanup_worktree_folder {
  local path="$1"

  choose "y" \
    "Remove $path? (y or n)" \
    "$GIT_TOOL worktree remove --force \"$path\"" \
    ":"
}

function check_and_cleanup_forlder {
  local path="$1"
  local branch="$2"

  if [ ! -z "$(contains_untracked_changes $path)" ] ; then
    printf "%s\n%s\n" "Warning: $path contains changes" "$(contains_untracked_changes $path)"
    cleanup_worktree_folder "$path"
  elif [ -z "$(is_upstream_branch_exists $path $branch)" ] ; then
    printf "%s\n" "Warning: $path doesn't have upstream branch"
    cleanup_worktree_folder "$path"
  elif [ ! -z "$(contains_unpushed_commits $path)" ] ; then 
    printf "%s\n%s\n" "Warning: $path" "$(contains_unpushed_commits $path)"
  else 
    cleanup_worktree_folder "$path"
  fi
}

GIT_TOOL=$(locate_git_tool)
[ -x "${GIT_TOOL}" ] || { printf "%b" "Fatal: 'git' tool not found.\n" ; exit 1 ; }
[ -d "$CUR_DIR/.git" -o -e "$CUR_DIR/.git" ] || { printf "%b" "Fatal: not a git repository.\n" ; exit 1 ; }

git_fetch

IFS=$'\n'       
for line in $($GIT_TOOL worktree list) ; do
  path=$(echo $line | awk '{print $1}')
  branch=$(echo $line | awk '{print $3}')
  branch="${branch%]}"
  branch="${branch#[}"
  if ! $(is_dir_exist "$path") ; then 
    echo "$path not exists"
  elif $(is_current_dir "$path") ; then
    :
  elif ! $(is_git_dir "$path") ; then 
    printf "%b" "Warning: not a git repository. Skip.\n" 
  else 
    check_and_cleanup_forlder "$path" "$branch"
  fi
done
unset IFS
