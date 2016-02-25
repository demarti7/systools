const commander = require('commander')
const update    = require('./update')
const aws       = require('aws-sdk')

aws.config.update(update.keyConfig)
aws.config.update(update.region)

module.exports = aws
