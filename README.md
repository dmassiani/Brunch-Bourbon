# Brunch Au Bourbon
### A simple starter project using Brunch.io, Bourbon.io, Jade, CoffeeScript

[Brunch](http://brunch.io) + [Bourbon](http://bourbon.io) + [Jade](http://jade-lang.com) + [CoffeeScript](http://coffeescript.org)

Features:
* Coffeescript / Jade / Sass / Stylus automatically compiled on save
* auto-reload during development saves you from manually refreshing the page
* Javascript / CSS minification for production
* Bourbon / Neat
* Source map support
* Flexboxgrid for bootstrap compatibility
*NOTE:* Neat is ready for flexbox, see [Refills](http://refills.bourbon.io)

## BUG

Actually, Neat bower component have a bug with her .bower.json files

**bower_components/bitters/.bower.json" must have `main` property. See https://github.com/paulmillr/read-components#README**

Fix this with add **"main": "app/assets/stylesheets/_neat.scss",** to .bower.json

## How to use Brunch au Bourbon

Prefered method if you have **Brunch** installed run :

`brunch new git clone https://github.com/dmassiani/Brunch-Bourbon.git myapp`

You must also install packages using bower. Either

Or if you have not **Brunch** installed run:

* `git clone https://github.com/dmassiani/Brunch-Bourbon.git` to clone 
  the **brunch-bourbon** repository
* `cd brunch-bourbon`
* `./scripts/init.sh` to install node packages

But I'm sur you have it

```
bower install
```
or
```
./node_modules/.bin/bower install
```

**sudo** brunch watch --server

*NOTE:* Depending upon your connection and processor speed the build can take
a substantial amount of time (3 - 15 minutes). The bower step is particularly
slow, because it downloads the complete git history. If you think that there
might be a problems, check you network traffic. If the build is still
downloading then it's still working.

### Using Jade

You will find the jade files in the `app` and `app/partials` directories.
Upon save the Jade files will be recompiled to HTML and added to the
`$templateCache`. When reverencing a partial use the path should begin with
`partial/` and end with `.html`. For example the `app/partials/nav.jade` would
be referenced in the Angular javascript code as 'partials/nav.html'.

### Running the app during development

* `./scripts/server.sh` to serve using **Brunch**

Then navigate your browser to [http://localhost:3333](http://localhost:3333)

*NOTE:* Occasionally the scripts will not load properly on the initial
load. If this occurs, refresh the page. Subsequent refresh will render
correctly. Also, the initial load will take longer then subsequent loads,
some where around 20 seconds is normal.

### Running the app in production

* `./scripts/production.sh` to minify javascript and css files.

Or

* **brunch build --production**
* **brunch b -P**

See [Brunch Commands](https://github.com/brunch/brunch/blob/stable/docs/commands.md)

### Using Bower

Outside watch :

To add Bower component use **bower install (component) --save**
To remove Bower component use **bower uninstall (component) --save**

Inside watch :

To add or update dependencies, modify the `component.json` file

and run `bower install`. The component will be added to the `vendor` directory.

### Common issues

Initial load does not render correctly; scripts are not loading. 
- Occasionally the scripts will not load properly on the initial load. If this
  occurs, refresh the page. Subsequent refresh will render correctly.

`EMFILE` error
- EMFILE means there are too many open files. Brunch watches all your project
  files and it's usually a pretty big number. You can fix this error with
  setting max opened file count to bigger number with command `ulimit -n 10000`.

The complete [Brunch FAQ](https://github.com/brunch/brunch/blob/master/docs/faq.rst)

## Contributers

[Complete list of code contributers](https://github.com/dmassiani/brunch-bourbon/graphs/contributors)
