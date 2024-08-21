layout_uv() {
  local python=${1:-python}
  [[ $# -gt 0 ]] && shift
  unset PYTHONHOME
  python_version=$($python -V | cut -w -f 2 | cut -d . -f 1-2)
  if [[ -z $python_version ]]; then
      log_error "Could not find python's version"
      return 1
  fi

  if [[ -n "${VIRTUAL_ENV:-}" ]]; then
      local REPLY
      realpath.absolute "$VIRTUAL_ENV"
      VIRTUAL_ENV=$REPLY
  else
      VIRTUAL_ENV=$(direnv_layout_dir)/python-$python_version
  fi
  if [[ ! -d $VIRTUAL_ENV ]]; then
      uv venv -p "$python" "$@" "$VIRTUAL_ENV"
  fi
  export VIRTUAL_ENV
  PATH_add "$VIRTUAL_ENV/bin"
}
