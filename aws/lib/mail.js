'use strict'
const nodemailer = require('nodemailer')
const sesTransport = require('nodemailer-ses-transport')

// your keys
const accessKeyId = process.env.SES_KEY || "YOUR KEY HERE"
const secretAccessKey = process.env.SES_SECRET || "YOUR KEY HERE"
function Mail() {
    const options = ({InstanceId, InstanceType}) => {
        const subject = `AWS EMAIL -  ${InstanceId}`
        const body = `
            <p> Instance Id: ${InstanceId}  </p>
            <p> Instance Type: ${InstanceType.Value} </p>
        `
        return {
            from: 'no-reply@homesteadroofs.ca',
            to: 'jmorenstein@live.com',
            subject: subject,
            html: body
        }
    }

    const transport = nodemailer.createTransport(sesTransport({
        accessKeyId: accessKeyId,
        secretAccessKey: secretAccessKey,
        rateLimit: 1
    }))

    const send = (options) => {
        transport.sendMail(options, (err, info) => {
            if(err) return console.error(err)

            console.log('Message sent: ' + info)
        })
    }

    return Object.freeze({
        send,
        options
    })
}

module.exports = new Mail()
