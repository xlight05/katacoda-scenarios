/*
 * Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const express = require('express');
const path = require('path');
const fs = require('fs');
const admZip = require('adm-zip');
const fse = require("fs-extra");

const assetsDir = "./assets";
const docsStorageDir = `${assetsDir}/images`;
const celleryRepoDir = '/root/.cellery/repo';
const docsViewBaseFilesDir = '/usr/share/cellery/docs-view';

const port = 9990;
let app = express();

app.use(express.json());
app.use(express.urlencoded({extended: false}));

const renderHelloWorldPage = (cell) => "<!DOCTYPE html>" +
    "<html lang='en'>" +
    "<head>" +
    "<meta charset='utf-8'>" +
    `<link rel="shortcut icon" href="/files/favicon.ico" type="image/x-icon"/>`+
    "<title>Cellery Docs View</title>" +
    "</head>" +
    "<body>" +
    `<h1>Cellery Docs View</h1>` +
    '<ol type = "1">' +
     generateCellListingHtml(cell) +
    '</ol>' +
    "</body>" +
    "</html";

function generateCellListingHtml(cell) {
    let resultString = "";
    for (let i = 0; i < cell.length; i++) {
        resultString += `<li><a href=${cell[i].url} target="_blank">${cell[i].name}</a></li>`
    }
    return resultString;
}

app.use("/docs", function (req, res) {
    createDocsViewFolder();
    let cell = getDocsViewDirInfo();
    res.send(renderHelloWorldPage(cell));
});


app.use('/files', express.static(assetsDir));

function getDocsViewDirInfo() {
    let dirInfoList = [];
    let files = fs.readdirSync(docsStorageDir);
    for (let i = 0; i < files.length; i++) {
        let filepath = path.join(docsStorageDir, files[i]);
        let stat = fs.lstatSync(filepath);
        if (stat.isDirectory()) {
            let cell = {
                name: files[i],
                url: path.join("/files/images", files[i])
            };
            dirInfoList.push(cell);
        }
    }
    return dirInfoList;
}

function createDocsViewFolder() {
    copyMetadataFromRepo(celleryRepoDir);
}

function copyMetadataFromRepo(directory) {
    let files = fs.readdirSync(directory);
    for (let i = 0; i < files.length; i++) {
        let filepath = path.join(directory, files[i]);
        let filename = files[i];
        let stat = fs.lstatSync(filepath);
        if (stat.isDirectory()) {
            copyMetadataFromRepo(filepath)
        } else if (filename.indexOf('.zip') >= 0) {
            let directoryList = path.dirname(filepath).split(path.sep);
            let cell = {
                name:directoryList[directoryList.length - 2],
                version:directoryList[directoryList.length - 1],
                org:directoryList[directoryList.length - 3]
            };

            if (!fs.existsSync(docsStorageDir)) {
                fs.mkdirSync(docsStorageDir);
            }

            let cellDocsFolderPath = path.join(docsStorageDir, `${cell.org}-${cell.name}-${cell.version}`);
            if (!fs.existsSync(cellDocsFolderPath)) {
                fs.mkdirSync(cellDocsFolderPath);
                fse.copySync(docsViewBaseFilesDir, cellDocsFolderPath);
                let zip = new admZip(filepath);
                zip.extractEntryTo("artifacts/cellery/metadata.json", path.join(cellDocsFolderPath, "data"), false, true);
                let cellDataFile = path.join(cellDocsFolderPath, "data" , "cell.js");
                fs.renameSync(path.join(cellDocsFolderPath, "data","metadata.json"), cellDataFile);
                let data = fs.readFileSync(cellDataFile);
                let fd = fs.openSync(cellDataFile, 'w+');
                let buffer = new Buffer('window.__CELL_METADATA__ = ');
                fs.writeSync(fd, buffer, 0, buffer.length, 0);
                fs.writeSync(fd, data, 0, data.length, buffer.length);
                fs.closeSync(fd);
            }
        }
    }
}


app.listen(port, () => console.log(`Docs view Service is running on port ${port}!`));

module.exports = app;
