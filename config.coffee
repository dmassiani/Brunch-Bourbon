exports.config =
  # See docs at https://github.com/brunch/brunch/blob/stable/docs/config.md.
  conventions:
    assets:  /^app\/public\//
    ignored: /^(bower_components\/bootstrap-less(-themes)?|app\/styles\/overrides|(.*?\/)?[_]\w*)/
  modules:
    definition: false
    wrapper: false
  paths:
    public: 'public'
  files:
    javascripts:
      joinTo:
        'assets/js/app.js': /^app/
        'assets/js/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo:
        'assets/css/app.css': /^(app|vendor|bower_components)/

    templates:
      joinTo:
        'assets/js/dontUseMe' : /^app/ # dirty hack for Jade compiling.

  plugins:
    jade:
      pretty: yes # Adds pretty-indentation whitespaces to output (false by default)
    browserSync:
      server:
        baseDir: 'public'
    assetsmanager:
        copyTo:
          'assets': ['app/images']
  # Enable or disable minifying of result js / css files.
  # minify: true
