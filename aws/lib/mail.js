'use strict'
const nodemailer = require('nodemailer')
const sesTransport = require('nodemailer-ses-transport')

const accessKeyId = process.env.SES_KEY || "YOURKEYHERE"
const secretAccessKey = process.env.SES_SECRET || "YOURKEYHERE"

function Mail() {
    const options = ({instanceId, instanceType}) => {
        const subject = `AWS EMAIL -  ${instanceType}`
        const body = ` <p> Instance Type: ${instanceId} </p>`
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
