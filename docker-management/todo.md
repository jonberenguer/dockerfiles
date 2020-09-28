

=== base image upgrade, rebuild child images ===

grep -R "FROM" . | grep Dockerfile
grep -R "FROM" . | grep Dockerfile | grep latest

pull the latest image
rebuild child images
delete <none> tag images

