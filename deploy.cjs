const { Client } = require('node-scp')
const fs = require('fs')
const path = require('path')
require('dotenv').config()

const config = {
  host: process.env.DEPLOY_SSH_HOST,
  port: process.env.DEPLOY_SSH_PORT,
  username: process.env.DEPLOY_SSH_USERNAME,
  password: process.env.DEPLOY_SSH_PASSWORD,
  localDir: './build',
  remoteDir: '/data/wwwroot/docs.warudo.app'
}

function joinRemote(client, ...args) {
  if (client.remotePathSep === path.win32.sep) {
    return path.win32.join(...args)
  }
  return path.posix.join(...args)
}

async function uploadDir(src, dest) {
  try {
    const isExist = await this.exists(dest)

    if (!isExist) {
      console.log(`mkdir: ${dest}`);
      await this.mkdir(dest)
    }

    const dirEntries = fs.readdirSync(src, {
      encoding: 'utf8',
      withFileTypes: true,
    })

    for (const e of dirEntries) {
      if (e.isDirectory()) {
        const newSrc = path.join(src, e.name)
        const newDst = joinRemote(this, dest, e.name)
        console.log(`upload dir: ${newDst}`);
        await this.uploadDir(newSrc, newDst)
      } else if (e.isFile()) {
        const newSrc = path.join(src, e.name)
        const newDst = joinRemote(this, dest, e.name)
        console.log(`upload file: ${newDst}`);
        await this.uploadFile(newSrc, newDst)
      }
    }
  } catch (error) {
    throw error
  }
}

async function submit() {
  if(!await fs.existsSync(config.localDir)) {
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
    // debug: console.log,
    compress: 'zlib'
  });
  console.log('Empting remote files...')
  await scpClient.emptyDir(config.remoteDir)
  console.log('Uploading files...')
  scpClient.uploadDir = uploadDir;
  await scpClient.uploadDir(config.localDir, config.remoteDir);
  await scpClient.close();
}catch(e) {
  console.log(e);
  throw e;
}
}

submit();