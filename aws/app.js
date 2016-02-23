const commander = require('commander')
const aws       = require('aws-sdk')
const ec2       = require('./ec2')(aws)

const accessKeyId = process.env.AWS_KEY
const secretKey   = process.env.AWS_SECRET

const keyConfig = {
    accessKeyId: accessKeyId,
    secretAccessKey: secretKey
}

aws.config.update(keyConfig)
aws.config.update({region: 'use-west-2'})
