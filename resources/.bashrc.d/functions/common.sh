function git-ignore {
  echo $1 >> .git/info/exclude
}

export -f git-ignore