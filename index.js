const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv').config();
const SaxonJS = require('saxon-js');
const stylesheet = require('./main.sef.json');
const app = express();

const homepage = (request, response) => {
  const options = { "stylesheetInternal": stylesheet,
                    "destination": "serialized" };
  SaxonJS.transform(options, "async")
  .then(output => {
    response.status(200).send(output.principalResult);
  }).catch(error => {
    response.status(400).send(error);
  });
};

const jsonpage = (request, response) => {
  const options = { "stylesheetInternal": stylesheet,
                    "stylesheetParams": { "payload": { "hello": "world" } },
                    "destination": "serialized" };
  SaxonJS.transform(options, "async")
  .then(output => {
    response.status(200).send(output.principalResult);
  }).catch(error => {
    response.status(400).send(error);
  });
};

app.use(cors());

app.route("/").get(homepage);
app.route("/json").get(jsonpage);

// Start server
app.listen(process.env.PORT, () => {
  console.log(`Server listening`);
});
