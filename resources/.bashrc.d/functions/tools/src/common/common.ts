import { defaultProvider } from "@aws-sdk/credential-provider-node";
import { fromSSO } from "@aws-sdk/credential-provider-sso";
import { Credentials } from "@aws-sdk/types";
import * as fs from 'fs';

export namespace Common {
  export async function getCredentials(profile?: string): Promise<Credentials> {
    const credentialProvider = profile ? fromSSO({ profile: profile }) : defaultProvider();
    return credentialProvider();
  }
  
  export async function writeJsonToFile(filename: string, data: Object): Promise<void> {
    return fs.promises.writeFile(filename, JSON.stringify(data), { encoding: "utf8" });
  }

  export async function readJsonFromFile(filename: string): Promise<Object | undefined> {
    return fs.promises.readFile(filename, { encoding: 'utf-8' })
      .then(v => JSON.parse(v))
      .catch(e => {
        if (e.code === 'ENOENT')
          return undefined;
        else
          throw e;
      });
  }

  export async function deleteFile(filename: string): Promise<void> {
    return fs.promises.unlink(filename);
  }
}