int main() 
{ 
   Stdio.FILE sock = Stdio.FILE(); 
   if(!sock->connect("54.175.219.8", 443)){
		write(strerror(sock->errno()));
	}
	SSL.context ctx = SSL.context();
    SSL.sslfile ssl = SSL.sslfile(sock,ctx); 
    ssl->write("GET /get HTTP/1.1"); 
	while(1){
		string str = ssl->read();
		write("Response:\n%s\n",str);
	}
	return -1;
} 
