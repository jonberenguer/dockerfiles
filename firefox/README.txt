

# steps

docker build -t jonberenguer/firefox .

docker run --rm -it \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
   run.local/firefox https://google.com/ 


# Hidden in C

cat << 'EOF' > firefox-container.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char command[512];

    strcpy( command, "docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix run.local/firefox https://google.com/ ");

    system(command);

    return(0);
}
