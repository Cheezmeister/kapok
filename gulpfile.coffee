SOURCE_FOLDER = 'src'
DIST_FOLDER = 'dist'
KARMA_CONFIG =  "#{__dirname}/karma.conf.js"

gulp = require('gulp')
coffee = require('gulp-coffee')
stylus = require('gulp-stylus')
uglify = require('gulp-uglify')
jasmine = require 'gulp-jasmine'

gulp.task 'coffee', ->
  # Sources
  gulp.src "#{SOURCE_FOLDER}/*.coffee"
      .pipe coffee bare: true
      .pipe uglify()
      .pipe gulp.dest DIST_FOLDER
  # Tests
  gulp.src "tst/*.coffee"
      .pipe coffee bare: true
      .pipe gulp.dest 'spec'


gulp.task 'stylus', ->
  gulp.src "#{SOURCE_FOLDER}/*.styl"
      .pipe stylus compress: true
      .pipe gulp.dest DIST_FOLDER

# gulp.task 'test', ->
#   gulp.src ['test/*.spec.js', "#{DIST_FOLDER}/greeter.js"]
#       .pipe jasmine(verbose: true)

gulp.task 'test', (done) ->
  Server = require('karma').Server
  new Server(
    {configFile: KARMA_CONFIG, singleRun: true },
    done
  ).start()


gulp.task 'tdd', (done) ->
  Server = require('karma').Server
  new Server(
    {configFile: KARMA_CONFIG},
    done
  ).start()

gulp.task 'default', ['coffee', 'stylus']
