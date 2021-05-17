SOURCE_FOLDER = 'src'
DIST_FOLDER = 'dist'
KARMA_CONFIG =  "#{__dirname}/karma.conf.js"

gulp = require('gulp')
coffee = require('gulp-coffee')
stylus = require('gulp-stylus')
jade = require('gulp-pug')

gulp.task 'coffee', ->
  # Sources
  gulp.src "#{SOURCE_FOLDER}/*.coffee"
      .pipe coffee bare: true
      .pipe gulp.dest DIST_FOLDER
  # Tests
  gulp.src "tst/*.spec.coffee"
      .pipe coffee bare: true
      .pipe gulp.dest 'spec'
  # Config files
  return gulp.src 'karma.conf.coffee'
      .pipe coffee bare: true
      .pipe gulp.dest '.'


gulp.task 'stylus', ->
  return gulp.src "#{SOURCE_FOLDER}/*.styl"
      .pipe stylus compress: true
      .pipe gulp.dest DIST_FOLDER

gulp.task 'jade', ->
  return gulp.src 'tst/*.jade'
      .pipe jade()
      .pipe gulp.dest '.'

exports.default = gulp.task 'default', gulp.series 'coffee', 'stylus'

gulp.task 'test', gulp.series 'default', (done) ->
  Server = require('karma').Server
  new Server(
    {configFile: KARMA_CONFIG, singleRun: true },
    done()
  ).start()


gulp.task 'tdd', gulp.series 'default', (done) ->
  Server = require('karma').Server
  new Server(
    {configFile: KARMA_CONFIG},
    done()
  ).start()

