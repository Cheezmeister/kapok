
module.exports = (config) ->
  config.set
    basePath: ''
    frameworks: ['jasmine']
    files: [
        'spec/kapok.spec.js'
      , 'dist/kapok.js'
    ]
    exclude: []
    preprocessors:
      'dist/kapok.js': 'coverage'
    reporters: 'progress coverage coveralls'.split ' '
    coverageReporter:
      type: 'lcov'
    port: 9876
    colors: true
    logLevel: config.LOG_INFO
    autoWatch: true
    browsers: ['Chrome']
    singleRun: false
    concurrency: Infinity
