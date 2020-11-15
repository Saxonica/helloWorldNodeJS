# Hello World in Saxon JS 2 on Node.js

This project contains (almost) the simplest possible “hello world”
example using Saxon JS 2 in Node.js.

## Prerequisites

This goal of this project is to show you how to get a simple Saxon JS
project up and running in Node.js. You have to install Node.js yourself.

## TL;DR

Run `npm install` to download and install the Node.js packages.

Run `npm run start:dev` to start the web application. This will be on
port 3002 by default. If you want to run it on a different port, edit `.env`.

Point your web browser at `http://localhost:3002/` and `http://localhost:3002/json`.

## What is it?

This application is a very simple node application that displays
“Hello, World” or displays the key/value pairs from a JSON map passed
to it.

That’s pretty dull to look at, but the cool part is what it does
behind the scenes.

## What does it do?

When you issue a GET for “/”, the main stylesheet is run and it
returns an HTML page with some static text.

When you issue a GET for “/json”, the main stylesheet is passed a JSON
map. The map is hard coded into `index.js`, but in real life it might
have come from another web service or from some other part of your
application. In this case, the stylesheet returns a page that shows
the key/value pairs in the map.

Unlike the [helloWorldJS](https://github.com/Saxonica/helloWorldJS)
example, this version runs the XSLT processor in Node.js, on the
server, not in your browser. Of course, there’s nothing to prevent you
from processing the output of this process with another XSLT process in the browser!

## How does it work?

There are a few moving pieces. They aren’t all strictly part of the
Saxon JS transformation, but they are intended to give you a sense of
how the pieces might fit together in a more realistic application.

### The sources

* `index.js` is an Express web application that supports two endpoints, “/” and “/json”.
  Both run the XSLT stylesheet to return the results.
* `main.sef.json` is the compiled stylesheet. The XSLT source is in `xslt/main.xsl`.
* `.env`, `package.json`, and `package-lock.json` are just Node.js
  furniture.

### The compiler

This project comes with a compiled version of the stylesheet. If you
make changes to it, you can compile it with `xslt-3` as follows:

```
$ node node_modules/xslt3/xslt3.js -t -xsl:xslt/main.xsl -export:main.sef.json -nogo "-ns:##html5"
```

You can also compile it with Saxon EE, if you prefer.

# Next steps

Once you have it running, you can start playing around. Make changes
to the stylesheet, recompile it, and see what happens!
