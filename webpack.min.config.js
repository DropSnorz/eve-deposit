var config = require('./webpack.config.js'),
    webpack = require('webpack');

config.plugins.push( new webpack.DefinePlugin({'process.env': 
  {'NODE_ENV': JSON.stringify('production')}}));

  config.plugins.push(new webpack.optimize.UglifyJsPlugin());

module.exports = config;