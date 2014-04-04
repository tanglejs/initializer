define [
  'loglevel'
], (loglevel) ->
  initializer = (options) ->
    @logger = loglevel
    @logger.setLevel(
      if build.environment == 'development' then 'trace' else 'warn'
    )
