
module.exports = (config) ->
  config.set
    basePath: ''
    frameworks: ['jasmine']
    files: [
        'spec/kapok.spec.js'
      , 'dist/kapok.js'
    ]
    exclude: []
    preprocessors: {}
    reporters: [ 'progress' ]
    port: 9876
    colors: true
    logLevel: config.LOG_INFO
    autoWatch: true
    browsers: ['Chrome']
    singleRun: false
    concurrency: Infinity
