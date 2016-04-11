import math

## Use this function to write data to socket
## write_string_to_socket(connection, message) where connection is the socket object and message is string

## Use this function to read data from socket
## def read_string_from_socket(connection) where connection is the socket object

## All global declarations go here
class Tree(object):
    def __init__(self):
        self.nodes = {}
        self.probs = {}
        self.depths = {1:0}

    def __repr__(self):
        return str(self.nodes)

    def __getitem__(self, child):
        return self.nodes[child]
    
    def insert(self, parent, child, prob):
        self.nodes[child] = parent
        self.probs[child] = math.log(float(prob) / 100.0, 10)
        self.depths[child] = self.depths[parent] + 1
        
    def probability(self, nodeA, nodeB):
        if nodeA == nodeB: 
            return 1
        dist = 0
        while nodeA != nodeB:
            da = self.depths[nodeA]
            db = self.depths[nodeB]
            if da == db:
                dist += self.probs[nodeA] + self.probs[nodeB]
                nodeA, nodeB = tree[nodeA], tree[nodeB]
            elif da < db:
                dist += self.probs[nodeB]
                nodeA, nodeB = nodeA, tree[nodeB]
            elif da > db:
                dist += self.probs[nodeA]
                nodeA, nodeB = tree[nodeA], nodeB
        return dist

tree = Tree()    
    
## This function is called only once before any client connection is accepted by the server.
## Read any global datasets or configurations here
def init_server():
    print "Reading training set"
    sys.stdout.flush()
    for line in open('training.txt'):
        cells = line.split(',')
        if len(cells) == 3:
            parent, child, prob = int(cells[0]), int(cells[1]), float(cells[2])
            tree.insert(parent, child, prob)
    
## This function is called everytime a new connection is accepted by the server.
## Service the client here
def process_client_connection(connection):

    while True:
        # read message 
        message = read_string_from_socket(connection)

        print "Message received = ", message
        cells = message.split(',')
        if len(cells) == 3:
            a, b, q = int(cells[0]), int(cells[1]), float(cells[2])
            prob = tree.probability(a, b)
            if prob >= q:
                answer = 'YES'
            else:
                answer = 'NO'
        else:
            answer = 'END'
        
        # write message
        write_string_to_socket(connection, answer)

        if message == "END":
            break

