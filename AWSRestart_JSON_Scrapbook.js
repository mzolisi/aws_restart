{
    "Reservations": [
        {
            "Instances": [
                {
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "PublicDnsName": "",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "EbsOptimized": false,
                    "LaunchTime": "2024-12-04T04:02:46.000Z",
                    "PrivateIpAddress": "10.5.1.172",
                    "ProductCodes": [],
                    "VpcId": "vpc-0f9b6c33e415dad71",
                    "CpuOptions": {
                        "CoreCount": 1,
                        "ThreadsPerCore": 2
                    },
                    "StateTransitionReason": "",
                    "InstanceId": "i-0ce0edb9c5432d307",
                    "EnaSupport": true,
                    "ImageId": "ami-0caf77f9b87412c51",
                    "PrivateDnsName": "ip-10-5-1-172.us-west-2.compute.internal",
                    "KeyName": "vockey",
                    "SecurityGroups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-05a2355a30318812f"
                        }
                    ],
                    "ClientToken": "7d7ee801-d495-fecb-4ae0-d67193f29bb0",
                    "SubnetId": "subnet-06088a0c56d05a4a7",
                    "InstanceType": "t3.micro",
                    "CapacityReservationSpecification": {
                        "CapacityReservationPreference": "open"
                    },
                    "NetworkInterfaces": [
                        {
                            "Status": "in-use",
                            "MacAddress": "02:21:72:60:06:6b",
                            "SourceDestCheck": true,
                            "VpcId": "vpc-0f9b6c33e415dad71",
                            "Description": "",
                            "NetworkInterfaceId": "eni-051d5661032e3b456",
                            "PrivateIpAddresses": [
                                {
                                    "PrivateDnsName": "ip-10-5-1-172.us-west-2.compute.internal",
                                    "Primary": true,
                                    "PrivateIpAddress": "10.5.1.172"
                                }
                            ],
                            "PrivateDnsName": "ip-10-5-1-172.us-west-2.compute.internal",
                            "InterfaceType": "interface",
                            "Attachment": {
                                "Status": "attached",
                                "DeviceIndex": 0,
                                "DeleteOnTermination": true,
                                "AttachmentId": "eni-attach-0a89de91a94e164db",
                                "AttachTime": "2024-12-04T04:02:46.000Z"
                            },
                            "Groups": [
                                {
                                    "GroupName": "default",
                                    "GroupId": "sg-05a2355a30318812f"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "OwnerId": "813683184127",
                            "SubnetId": "subnet-06088a0c56d05a4a7",
                            "PrivateIpAddress": "10.5.1.172"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Placement": {
                        "Tenancy": "default",
                        "GroupName": "",
                        "AvailabilityZone": "us-west-2a"
                    },
                    "Hypervisor": "xen",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/xvda",
                            "Ebs": {
                                "Status": "attached",
                                "DeleteOnTermination": true,
                                "VolumeId": "vol-06fca05f6082ce29f",
                                "AttachTime": "2024-12-04T04:02:47.000Z"
                            }
                        }
                    ],
                    "Architecture": "x86_64",
                    "RootDeviceType": "ebs",
                    "RootDeviceName": "/dev/xvda",
                    "VirtualizationType": "hvm",
                    "Tags": [
                        {
                            "Value": "ERPSystem",
                            "Key": "Project"
                        },
                        {
                            "Value": "c136403a3483787l8634324t1w813683184127",
                            "Key": "aws:cloudformation:stack-name"
                        },
                        {
                            "Value": "portal",
                            "Key": "Application"
                        },
                        {
                            "Value": "1.0",
                            "Key": "Version"
                        },
                        {
                            "Value": "staging",
                            "Key": "Environment"
                        },
                        {
                            "Value": "HR",
                            "Key": "Department"
                        },
                        {
                            "Value": "app server",
                            "Key": "Name"
                        },
                        {
                            "Value": "c136403a3483787l8634324t1w813683184127",
                            "Key": "cloudlab"
                        },
                        {
                            "Value": "Instance5",
                            "Key": "aws:cloudformation:logical-id"
                        },
                        {
                            "Value": "arn:aws:cloudformation:us-west-2:813683184127:stack/c136403a3483787l8634324t1w813683184127/85cd3710-b1f4-11ef-91aa-060b725cf641",
                            "Key": "aws:cloudformation:stack-id"
                        }
                    ],
                    "HibernationOptions": {
                        "Configured": false
                    },
                    "MetadataOptions": {
                        "State": "applied",
                        "HttpEndpoint": "enabled",
                        "HttpTokens": "optional",
                        "HttpPutResponseHopLimit": 1
                    },
                    "AmiLaunchIndex": 0
                }
            ],
            "ReservationId": "r-097e21ed9e17cd9e4",
            "RequesterId": "658754138699",
            "Groups": [],
            "OwnerId": "813683184127"
        },



        {
    "Reservations": [
        {
            "Instances": [
                {
                    "Tags": [
                        {
                            "Value": "ERPSystem",
                            "Key": "Project"
                        },
                        {
                            "Value": "c136403a3483787l8634324t1w813683184127",
                            "Key": "aws:cloudformation:stack-name"
                        },
                        {
                            "Value": "portal",
                            "Key": "Application"
                        },
                        {
                            "Value": "1.0",
                            "Key": "Version"
                        },
                        {
                            "Value": "staging",
                            "Key": "Environment"
                        },



            $instance['Tags']['Key'] = 'Environment'


                                                $environmentCheck = $instance['Tags']['Key'];
                                                echo "\tENVIRONMENT_CHECK_VARIABLE:" . $environmentCheck ."\n";
                                                if ($instance['Tags']['Key'] == 'Environment') {
                                                        echo"\tTAGGED INSTANCE CANDIDATE" . $instance['InstanceId'] . "MUST NOT BE STOPPED\n";
                                                } else {
                                                        echo"\tUNTAGGED INSTANCE CANDIDATE" . $instance['InstanceId'] . "CAN BE STOPPED\n";
                                                }



if ($instance['Tags']['Key'] == 'Environment') {
        echo"\tTAGGED INSTANCE CANDIDATE" . $instance['InstanceId'] . "MUST NOT BE STOPPED\n";
} else {
        echo"\tUNTAGGED INSTANCE CANDIDATE" . $instance['InstanceId'] . "CAN BE STOPPED\n";
}



$environmentCheck = $instance['Tags']['Key'];
echo "\tENVIRONMENT_CHECK_VARIABLE:" . $environmentCheck ."\n";



$environmentCheck = $instance['Tags']['Key'];
echo "\tENVIRONMENT_CHECK_VARIABLE:" . $environmentCheck ."\n";
if ($instance['Tags']['Key'] == 'Environment') {
echo"\tTAGGED INSTANCE CANDIDATE" . $instance['InstanceId'] . "MUST NOT BE STOPPED\n";
} else {
echo"\tUNTAGGED INSTANCE CANDIDATE" . $instance['InstanceId'] . "CAN BE STOPPED\n";
}


{
    "Reservations": [
        {
            "Instances": [
                {
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "PublicDnsName": "",
                    "State": {
                        "Code": 16,
                        "Name": "running"



if (array_key_exists("Environment",$environmentCheck)) {
    echo "Key exists!";
} else {
    echo "Key does not exist!";
}
