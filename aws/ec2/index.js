module.exports = function (aws) {
    const ec2 = new aws.EC2()

    function whatsRunning() {
        const request = ec2.describeInstances()

        request.on('success', (response) => {
            console.log(response.data);
        })

        request.on('error', (error) => {
            console.error(error)
        })

        request.send()
    }

    return {
        whatsRunning
    }
}
