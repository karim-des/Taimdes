const fs = require("fs");
const path = require("path");

const logoDir = path.join(__dirname, "logo");
const outputFile = path.join(__dirname, "logo-files.js");
const validExtensions = /\.(png|jpe?g|webp|svg)$/i;

const files = fs
  .readdirSync(logoDir)
  .filter((name) => validExtensions.test(name))
  .sort((a, b) =>
    a.localeCompare(b, undefined, { numeric: true, sensitivity: "base" }),
  );

const js = `window.FILE_LIST = [\n${files.map((name) => `  "${name}"`).join(",\n")}\n];\n`;
fs.writeFileSync(outputFile, js, "utf8");
console.log(`Wrote ${files.length} logo files to ${outputFile}`);
