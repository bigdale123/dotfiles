#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>
#include <netdb.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <getopt.h>
#include <sys/socket.h>
#include <netinet/in.h>

#define BUFSIZE 1024

#define USAGE                                                        \
    "usage:\n"                                                         \
    "  echoserver [options]\n"                                         \
    "options:\n"                                                       \
    "  -p                  Port (Default: 48593)\n"                    \
    "  -m                  Maximum pending connections (default: 5)\n" \
    "  -h                  Show this help message\n"

/* OPTIONS DESCRIPTOR ====================================================== */
static struct option gLongOptions[] = {
    {"port",          required_argument,      NULL,           'p'},
    {"help",          no_argument,            NULL,           'h'},
    {"maxnpending",   required_argument,      NULL,           'm'},
    {NULL,            0,                      NULL,             0}
};


int main(int argc, char **argv) {
    int portno = 48593; /* port to listen on */
    int option_char;
    int maxnpending = 5;
  
    // Parse and set command line arguments
    while ((option_char = getopt_long(argc, argv, "p:m:hx", gLongOptions, NULL)) != -1) {
        switch (option_char) {
        case 'm': // server
            maxnpending = atoi(optarg);
            break; 
        case 'h': // help
            fprintf(stdout, "%s ", USAGE);
            exit(0);
            break;
        case 'p': // listen-port
            portno = atoi(optarg);
            break;                                        
        default:
            fprintf(stderr, "%s ", USAGE);
            exit(1);
        }
    }

    setbuf(stdout, NULL); // disable buffering

    if ((portno < 1025) || (portno > 65535)) {
        fprintf(stderr, "%s @ %d: invalid port number (%d)\n", __FILE__, __LINE__, portno);
        exit(1);
    }
    if (maxnpending < 1) {
        fprintf(stderr, "%s @ %d: invalid pending count (%d)\n", __FILE__, __LINE__, maxnpending);
        exit(1);
    }


    /* Socket Code Here */

    struct sockaddr_in connection_details;

    int server = socket(AF_INET, SOCK_STREAM, 0);
    if (server < 0) {
        fprintf(stderr, "Failed to create socket\n");
        exit(1);
    }

    connection_details.sin_family = AF_INET;
    connection_details.sin_addr.s_addr = INADDR_ANY;
    connection_details.sin_port = htons(portno); // Gotta use htons to get in network byte order, per man page

    struct sockaddr* con_det_ptr = &connection_details;
    if(bind(server, con_det_ptr, sizeof(connection_details)) < 0) {
        fprintf(stderr, "Failed to bind socket\n");
        exit(1);
    }

    if (listen(server, maxnpending) < 0) {
        fprintf(stderr, "Failed to make socket listen\n");
        exit(1);
    }

    printf("Server listening (we made it this far...)\n");

    char buffer[16];

    while(1) {
        int connection = accept(server, con_det_ptr, (socklen_t*)&connection_details);
        if (connection < 0) {
            fprintf(stderr, "Failed to accept connection\n");
            exit(1);
        }
        int message_length_bytes = read(connection, buffer, 15);
        if (message_length_bytes > 0) {
            printf("%s\n",buffer);
        }
        else {
            fprintf(stderr, "Failed to read message\n");
            exit(1);
        }
        close(connection);
    }

    return 0;
}
