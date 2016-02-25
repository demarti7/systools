const accessKeyId = process.env.ACCESS_ID || "YOURSECRETKEY"
const secretKey   = process.env.SECRET_KEY || "YOURSECRETKEY"

const keyConfig = {
    accessKeyId: accessKeyId,
    secretAccessKey: secretKey
}

const region = { region: 'us-west-2' }

exports.keyConfig = keyConfig
exports.region = region
