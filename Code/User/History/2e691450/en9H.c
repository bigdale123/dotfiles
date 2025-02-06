#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <netdb.h>
#include <string.h>
#include <errno.h>
#include <getopt.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

#define BUFSIZE 512

#define USAGE                                                \
  "usage:\n"                                                 \
  "  transferclient [options]\n"                             \
  "options:\n"                                               \
  "  -p                  Port (Default: 23948)\n"            \
  "  -s                  Server (Default: localhost)\n"      \
  "  -h                  Show this help message\n"           \
  "  -o                  Output file (Default cs6200.txt)\n" 

/* OPTIONS DESCRIPTOR ====================================================== */
static struct option gLongOptions[] = {
    {"output", required_argument, NULL, 'o'},
    {"server", required_argument, NULL, 's'},
    {"help", no_argument, NULL, 'h'},
    {"port", required_argument, NULL, 'p'},
    {NULL, 0, NULL, 0}};

/* Main ========================================================= */
int main(int argc, char **argv)
{
    int option_char = 0;
    unsigned short portno = 23948;
    char *hostname = "localhost";
    char *filename = "cs6200.txt";

    setbuf(stdout, NULL);

    // Parse and set command line arguments
    while ((option_char = getopt_long(argc, argv, "s:p:o:hx", gLongOptions, NULL)) != -1) {
        switch (option_char) {
        case 's': // server
            hostname = optarg;
            break;
        case 'p': // listen-port
            portno = atoi(optarg);
            break;
        default:
            fprintf(stderr, "%s", USAGE);
            exit(1);
        case 'o': // filename
            filename = optarg;
            break;
        case 'h': // help
            fprintf(stdout, "%s", USAGE);
            exit(0);
            break;
        }
    }

    if (NULL == hostname) {
        fprintf(stderr, "%s @ %d: invalid host name\n", __FILE__, __LINE__);
        exit(1);
    }

    if (NULL == filename) {
        fprintf(stderr, "%s @ %d: invalid filename\n", __FILE__, __LINE__);
        exit(1);
    }

    if ((portno < 1025) || (portno > 65535)) {
        fprintf(stderr, "%s @ %d: invalid port number (%d)\n", __FILE__, __LINE__, portno);
        exit(1);
    }

    /* Socket Code Here */
    struct sockaddr_in connection_details;
    
    struct hostent *ip_address = gethostbyname(hostname);
    unsigned long server_addr = *(unsigned long *)(ip_address->h_addr_list[0]);

    int client = socket(AF_INET, SOCK_STREAM, 0);
    if (client < 0) {
        fprintf(stderr, "Failed to create socket\n");
        exit(1);
    }

    connection_details.sin_family = AF_INET;
    connection_details.sin_addr.s_addr = server_addr;
    connection_details.sin_port = htons(portno); // Gotta use htons to get in network byte order, per man page

    struct sockaddr* con_det_ptr = (struct sockaddr*)&connection_details; // type casting for bind and accept
    if (connect(client, con_det_ptr, sizeof(connection_details)) < 0) {
        fprintf(stderr, "Failed to connect socket\n");
        exit(1);
    }

    send(client, message, strlen(message), 0);

    for(int i = 0; i < 15; i++){
        message[i] = 0;
    }

    read(client, message, 15);
    printf("%s", message);

    close(client);

    return 0;
}
