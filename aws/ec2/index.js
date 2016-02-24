module.exports = function (aws) {
    const ec2 = new aws.EC2()

    ,

    whatsRunning = () => {
        const request = ec2.describeInstances()

        request.on('success', (response) => {
            console.log(response.data);
        })

        request.on('error', (error) => {
            console.error(error)
        })

        request.send()
    }

    ,

    spinUp = () => {
        return ec2.runInstances({
            // commander will fill object values here
            // this is just some dummy shit for now
            ImageId: 'ami-97XXXXX',
            MaxCount: 2,
            MinCount: 1,
            BlockDeviceMappings: [
               {
                   DeviceName: '/dev/sda1',
                   Ebs: {
                       DeleteOnTermination: true,
                       VolumeSize: 10
                   }
               }
            ],
            InstanceType: 't1.micro',
            SecurityGroupIds: ['sg-074d9862'],
            Monitoring: {Enabled: false}
        }, (err, result) => {
            if (err) {
                console.error(err)
                return
            }

            console.log('Instance spun', result)
        })
    }

    return Object.freeze({
        whatsRunning,
        spinUp
    })
}
