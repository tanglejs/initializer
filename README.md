# tangle-initializer

> Tasks for working with tangle initializers

[![Travis Build Status](https://secure.travis-ci.org/tanglejs/initializer.png?branch=master)](http://travis-ci.org/tanglejs/initializer)
[![Dependency Status](https://david-dm.org/tanglejs/tangle-initializer.png)](https://david-dm.org/tanglejs/initializer)
[![devDependency Status](https://david-dm.org/tanglejs/initializer/dev-status.png)](https://david-dm.org/tanglejs/initializer#info=devDependencies)

[![NPM](https://nodei.co/npm/tangle-initializer.png?downloads=true)](https://nodei.co/npm/tangle-initializer/)

## Overview

[tangle](https://github.com/tanglejs/tangle) is a set of tools
for building web applications.

`initializer` implements the `initializer` subcommand for
[tangle](https://github.com/tanglejs/tangle).


## Usage

    --option, -o [String] - An example option.
    --help, -h - Display this message


## Contributing

The test suite is implemented with
[nodeunit](https://github.com/caolan/nodeunit) and
[nixt](https://github.com/vesln/nixt).

To rebuild & run the tests

    $ git clone https://github.com/tanglejs/initializer.git
    $ cd initializer
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `tangle` to use
your modified `initializer` during development.

To contribute back, fork the repo and open a pull request with your changes.


## License

Copyright (c) 2014 Logan Koester
Licensed under the MIT license.


