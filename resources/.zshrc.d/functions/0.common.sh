function git-ignore {
  echo $1 >> .git/info/exclude
}

function singleton() {
  eof="#EOF"
  file_directory="${DOTFILES_DIR}/temp"
  hash=$(echo "$*" | md5sum | awk '{ print $1 }')
  filepath="${file_directory}/${hash}"

  if [ ! -d "${file_directory}" ] ; then
    mkdir -p "${file_directory}"
  fi

  if [ ! -f "${filepath}" ] ; then
    echo "${eof}" > "${filepath}"
  fi

  if grep -wq "${eof}" "${filepath}" ; then
    echo -n > "${filepath}"
    ($* | tee "${filepath}"; echo "${eof}" >> "${filepath}")
  else
    pid=$(ps aux | grep "${hash}" | awk '{ print $2 }' | tail -n 1)
    tail -f --pid="${pid}" "${filepath}" | grep --line-buffered -v "${eof}"
  fi
}