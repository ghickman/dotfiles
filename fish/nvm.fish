set --export NVM_DIR "$HOME/.nvm"

if test -e "/usr/local/opt/nvm/nvm.sh"
    sh /usr/local/opt/nvm/nvm.sh --no-use  # This loads nvm
end

# configure direnv to work with NVM
set --export NODE_VERSIONS "$NVM_DIR/versions/node"
set --export NODE_VERSION_PREFIX "v"
