jsyaml = require 'js-yaml'

module.exports = (grunt) ->
  devDeps = grunt.file.readJSON('package.json').devDependencies

  for taskName of devDeps
    if 'grunt-' is taskName.substring 0, 6
      grunt.loadNpmTasks taskName
  
  BIN = "#{ process.cwd() }/node_modules/.bin/"

  SRC_ROOT = 'src/'
  DEST_ROOT = 'out/'
