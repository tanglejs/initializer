#!/usr/bin/env coffee

path = require 'path'
helpers = require('yeoman-generator').test

exports.command =
  description: 'Tasks for working with tangle initializers'

if require.main is module
  generator = require(path.join(__dirname, '..'))
  helpers.createGenerator('tangle:initializer', [[generator, 'tangle:initializer']]).run()
