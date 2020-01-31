#!/usr/bin/python

import subprocess

def runcommand(cmd):
    process = subprocess.Popen(cmd, 
                stdout=subprocess.PIPE,
                universal_newlines=True)

    while True:
        output = process.stdout.readline()
        print(output.strip())
        # Do something else
        return_code = process.poll()
        if return_code is not None:
            print('RETURN CODE', return_code)
            # Process has finished, read rest of the output 
            for output in process.stdout.readlines():
                print(output.strip())
            break


BASEFILE="baseline-docker-images.txt"


docker_rmi = "sudo docker rmi".split(" ")
docker_pull = "sudo docker pull".split(" ")


def refresh_images():
    with open(BASEFILE, 'r') as fobj:
        for line in fobj:
            cmd = docker_rmi + [line.strip()]
            print(' '.join(cmd))
            runcommand(cmd)
            
            cmd = docker_pull + [line.strip()]
            print(' '.join(cmd))
            runcommand(cmd)
            

def app():
    refresh_images()


if __name__ == "__main__":
    app()
