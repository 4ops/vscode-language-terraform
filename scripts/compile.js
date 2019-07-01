const fs = require('fs').promises;

const log = {
  error: (msg, err = {}) => {
    console.error(`[ERROR] ${msg}`);
    if (err !== {}) console.error(JSON.stringify(err, undefined, 2));
  },

  info: msg => console.log(`[INFO] ${msg}`),
}

function yamlToJson(yamlData, indent = 2) {
  const yaml = require('js-yaml');

  return new Promise((resolve, reject) => {
    try {
      const json = yaml.load(yamlData, undefined, {});
      const jsonData = JSON.stringify(json, undefined, indent);
      resolve(jsonData);
    } catch (error) {
      reject(error);
    }
  });
}

function getGrammars() {
  return new Promise((resolve, reject) => {
    try {
      const { contributes } = require("../package.json");
      const { grammars } = contributes;
      const paths = [];
      grammars.map(g => typeof g.path === 'string' ? paths.push(g.path) : undefined);
      resolve([...new Set(paths)]);
    } catch (error) {
      reject(error);
    }
  });
}

getGrammars()
  .then(jsonPaths =>
    jsonPaths.map(jsonPath =>
      fs.realpath(jsonPath.replace('.json', '.yaml'))
        .then(yamlPath => fs.readFile(yamlPath, 'utf8'))
        .then(yamlData => yamlToJson(yamlData))
        .then(jsonData => fs.writeFile(jsonPath, jsonData))
        .then(() => log.info(`Item compiled successfully: ${jsonPath}`))
        .catch(error => {
          log.error(`Failed to process item: ${jsonPath}`, error);
          process.exit(1);
        })
    )
  )
  .catch(error => {
    log.error(`Failed to get grammars`, error);
    process.exit(42);
  });
