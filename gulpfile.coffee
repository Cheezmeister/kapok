DIST_FOLDER = 'dist'

gulp = require('gulp')
coffee = require('gulp-coffee')
stylus = require('gulp-stylus')
uglify = require('gulp-uglify')

gulp.task 'coffee', ->
  gulp.src '*.coffee'
      .pipe coffee bare: true
      .pipe uglify()
      .pipe gulp.dest DIST_FOLDER

gulp.task 'stylus', ->
  gulp.src '*.styl'
      .pipe stylus compress: true
      .pipe gulp.dest DIST_FOLDER

gulp.task 'default', ->
  gulp.run 'coffee'
  gulp.run 'stylus'
