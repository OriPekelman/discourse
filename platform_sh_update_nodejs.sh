unset NPM_CONFIG_PREFIX
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | dash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
nvm alias default node
ln -s /app/.nvm/versions/node/v11.10.0/bin/node /app/.nvm/versions/node/v11.10.0/bin/nodejs