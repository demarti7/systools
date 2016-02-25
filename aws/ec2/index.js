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
            InstanceType: 't2.micro',
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

    ,

    kill = () => {
        const params = {
            InstanceIds: [
                // commander will be used to fill this via args at a later time
                'i-f733bd30'
            ],
            DryRun: false
        }

        ec2.terminateInstances(params, (err, data) => {
            if (err) return console.error(err, err.stack)

            console.log(data)
        })
    }

    ,

    typeInfo = () => {
        const params = {
            Attribute: 'instanceType',
            InstanceId: 'i-2049f8e7'
        }

        return new Promise((resolve, reject) => {
            ec2.describeInstanceAttribute(params, (err, data) => {
                if (err) {
                    reject(err)
                    return console.error(err, err.stack)
                }

                resolve(data)
            })
        })
    }

    ,

    getAllTypeInfo = () => {
        const params = {
            Filters: [
                {
                    Name: 'tag-key',
                    Values: ['Production']
                },
                {
                    Name: 'tag-value',
                    Values: ['Node']
                }
            ]
        }

        return new Promise((resolve, reject) => {
            ec2.describeInstances(params, function(err, data) {
              if (err) {
                  reject(err)
                  return console.error(err, err.stack)
              }

              resolve(data)
            })
        })
    }

    return Object.freeze({
        whatsRunning,
        spinUp,
        kill,
        typeInfo,
        getAllTypeInfo
    })
}
