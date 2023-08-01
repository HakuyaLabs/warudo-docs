const { Client } = require('node-scp')
const fs = require('fs')
require('dotenv').config()

const config = {
  host: process.env.DEPLOY_SSH_HOST,
  port: process.env.DEPLOY_SSH_PORT,
  username: process.env.DEPLOY_SSH_USERNAME,
  password: process.env.DEPLOY_SSH_PASSWORD,
  localDir: './build',
  remoteDir: '/data/wwwroot/docs.warudo.app'
}

async function submit() {
  if(!await fs.existsSync('./build')) {
    throw Error('Build file not exists, run `yarn build` first.')
  }
  try{
  const scpClient = await Client({
    host: config.host,
    port: config.port,
    username: config.username,
    password: config.password,
    // privateKey: fs.readFileSync('./key.pem'),
    // passphrase: 'your key passphrase',
    // debug: console.log
  });
  console.log('Uploading files...')
  await scpClient.emptyDir(config.remoteDir)
  await scpClient.uploadDir(config.localDir, config.remoteDir);
  await scpClient.close();
}catch(e) {
  console.log(e);
  throw e;
}
}

submit();