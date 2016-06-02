int main() 
{ 
   Stdio.FILE sock = Stdio.FILE(); 
   if(!sock->connect("127.0.0.1", 443)){
		write(strerror(sock->errno()));
	}
	SSL.context ctx = SSL.context();
    SSL.sslfile ssl = SSL.sslfile(sock,ctx,1,1);
    ssl->set_blocking();
 //   ssl->connect();
    ssl->write("GET / HTTP/1.1\r\n\r\n");
	string str = ssl->read(1024,1);
	write("Response:\n%s\n",str);
	return -1;
} 
