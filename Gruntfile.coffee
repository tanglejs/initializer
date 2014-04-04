#
# * initializer
# * https://github.com/tanglejs/initializer
# *
# * Copyright (c) 2014 Logan Koester
# * Licensed under the MIT license.
#

path = require 'path'
tangleUtil = require 'tangle-util'

module.exports = (grunt) ->
  #
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean:
      docs: ['man/']
      tests: ['tests/tmp/']

    watch:
      all:
        files: [
          'bin/**/*'
          'Gruntfile.coffee'
          'subcommands/*/templates/**/*'
          'subcommands/**/*.coffee'
          'readme/**/*.md'
          'tests/**/*.coffee'
          '!tests/tmp/**/*'
        ]
        tasks: ['default']

    mochacli:
      options:
        compilers: ['coffee:coffee-script/register']
      all: ['tests/**/*_test.coffee']

    readme_generator:
      help:
        options:
          output: 'tangle-initializer.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-initializer'
          package_name: 'tangle-initializer'
        order:
          'usage.md': 'Usage'

      readme:
        options:
          banner: 'banner.md'
          generate_title: false
          has_travis: false
          github_username: 'logankoester'
          generate_footer: false
          table_of_contents: false
        order:
          'overview.md': 'Overview'
          'usage.md': 'Usage'
          'contributing.md': 'Contributing'
          'license.md': 'License'

    bump:
      options:
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-readme-generator'
  grunt.loadNpmTasks 'grunt-mocha-cli'
  grunt.loadNpmTasks 'grunt-bump'

  tangleUtil.grunt.registerMarkedMan 'manpage-initializer', grunt,
    path.join(__dirname, 'tangle-initializer.md'),
    path.join(__dirname, 'man', 'tangle-initializer.1')

  grunt.registerTask 'build', ['clean', 'readme_generator', 'manpage-initializer']
  grunt.registerTask 'test', ['mochacli']
  grunt.registerTask 'default', ['build', 'test']
