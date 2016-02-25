const commander = require('commander')
const mail      = require('../lib/mail')
const aws       = require('../app')
const ec2       = require('../ec2')(aws)

ec2.typeInfo()

    .then((response) => {
         const typeInfo = mail.options(response)
         mail.send(typeInfo)
    })

    .catch((err) => {
        mail.send({err})
    })
