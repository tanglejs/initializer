glob = require 'glob'
fs = require 'fs'
path = require 'path'
yeoman = require 'yeoman-generator'
_ = require 'lodash'
_.str = require 'underscore.string'
tangleUtil = require 'tangle-util'

module.exports = class InitializerGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super(args, options, config)
    @args = args
    @options = options
    @sourceRoot path.join __dirname, 'templates'

    @on 'end', ->
      conf = require('tangle-config').getConf()
      conf.file
        file: path.join( @settings['initializer:target'], 'tangle.json' )

      initializers = conf.get 'initializers'
      initializers ||= {}

      initializers[@settings['initializer:name'].split('.')[0]] =
        path.join( @settings['initializer:target'], 'initializers', @settings['initializer:name'] )

      conf.set 'initializers', initializers
      conf.save (err) -> if err then throw err

InitializerGenerator::Prompts =  ->
  done = @async()

  glob '**/tangle.json',
    sync: true
  , (err, matches) =>
    @targetChoices  = _.compact _.map matches, (match) =>
      parsed = JSON.parse fs.readFileSync(match)
      name = parsed.name
      type = parsed.type
      if (type == 'app' || type == 'module')
        value = path.dirname(match)
        return { name: "#{name} (#{type}) #{value}/", value: value }
      else
        return  null

  # See https://github.com/SBoudrias/Inquirer.js/blob/master/README.md
  @prompt [
    type: 'list'
    name: 'initializer:target'
    message: 'Add to which app or module?'
    choices: @targetChoices
  ,
    type: 'list'
    name: 'initializer:template'
    message: 'Choose an template'
    choices: [
      { name: 'empty', value: '_empty.coffee' }
      { name: 'loglevel', value: '_loglevel.coffee' }
    ]
    default: '_empty.coffee'
  ,
    type: 'input'
    name: 'initializer:name'
    message: 'Initializer name'
    default: (settings) ->
      tmp = settings['initializer:template']
      _.last(tmp, tmp.length - 1).join('')

  ], (settings) =>
    @settings = settings
    done()

InitializerGenerator::applyTemplate = ->
  @copy @settings['initializer:template'],
    path.join( @settings['initializer:target'], 'initializers', @settings['initializer:name'] )
