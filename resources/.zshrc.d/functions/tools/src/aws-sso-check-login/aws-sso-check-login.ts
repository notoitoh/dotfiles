import * as yargs from 'yargs';
import { Common } from '../common/common';

(async () => {
  const fileName = `${__dirname}/.temp.json`;
  const argv = await yargs
    .option('force', {
      Boolean: true
    })
    .help()
    .argv;

  if (argv.force) {
    console.log('force')
    Common.deleteFile(fileName);
  }
  const temp = await Common.readJsonFromFile(fileName);
  const expirationDate = temp?.['expiration'] ? new Date(temp?.['expiration']) : undefined;
  if (expirationDate && expirationDate > new Date())
  {
    process.exit(0);
  }
  else {
    const credentials = await Common.getCredentials();
    if (!credentials) {
      console.log('LOGOUT');
      process.exit(1);
    }
    else {
      return Common.writeJsonToFile(
        fileName,
        {
          expiration: credentials.expiration?.toISOString()
        }
      );
    }
  }
})()
  .catch(() => {
    console.log('LOGOUT');
    process.exit(1);
  });