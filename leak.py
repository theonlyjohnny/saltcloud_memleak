from time import sleep

import objgraph

import salt.cloud
import boto3

class Looper(object):
    def __init__(self):
        self.i=0
    def loop(self):
        print("\n", flush=True)
        if self.i==2:
            print("This is where the issues starts appearing -- you can see that there are certain objects being created that aren't being cleaned up or reused, on every iteration. You can run `docker stats` on your machine and see that the memory for this container will continously rise, eventually causing an OOM")
        elif self.i < 2:
            print("Please ignore this outputs -- these are are objects that are normally created by the boto/salt bootstrapping")
        objgraph.show_growth(limit=20)
        boto_client.describe_instances()
        self.i+=1
        sleep(5)

if __name__ == "__main__":
    salt_client = salt.cloud.CloudClient('/etc/salt/cloud')
    boto_client = boto3.client('ec2')
    looper = Looper()
    while True:
        looper.loop()
