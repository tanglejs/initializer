define [
  'backbone.marionette'
], (Marionette) ->
  initializer = (options) ->

    # Enable if you want to work with a legacy web server that doesn't support
    # Backbone's default REST/HTTP approach
    Backbone.emulateHTTP = false

    # Enable If you're working with a legacy web server that can't handle
    # requests encoded as application/json
    Backbone.emulateJSON = false

    @on 'initialize:after', (options) ->
      Backbone.history.start
        hashChange: true
        pushState: true
        silent: false
        root: '/'
