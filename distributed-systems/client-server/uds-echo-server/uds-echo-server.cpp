/* 
* @Author: Zeyuan Shang
* @Date:   2016-01-21 23:45:49
* @Last Modified by:   Zeyuan Shang
* @Last Modified time: 2016-01-21 23:45:57
*/

/*
Write your code here
This function is called everytime a new connection is accepted by the server

Use this function to write data to socket
void write_string_to_socket(int sock_descriptor, char* message, uint32_t length);

Use this function to read data from socket
void read_string_from_socket(int sock_descriptor, char** message, uint32_t *length);


*/
void * process_client_connection(void * ptr)
{
    connection_t * conn;

    if (!ptr) pthread_exit(0); 
    conn = (connection_t *)ptr;

    printf("Connection received\n");

    int terminate_client = 0;
    do
    {
        /* read length of message */
        char *message = NULL;
        uint32_t message_length = 0;

        /* read message */
        read_string_from_socket(conn->sock, &message, &message_length);
        
        printf("Received = %s\n", message);
        
         /* Your logic goes here */
        write_string_to_socket(conn->sock, message, message_length);
        
        /* End of operation on this clinet */
        if (strcmp(message, "END") == 0)
            terminate_client = 1;
        
        free(message);

    } while(!terminate_client);

    /* close socket and clean up */
    printf("Closing client on socket %d\n", conn->sock);
    close(conn->sock);
    free(conn);
    pthread_exit(0);
}
