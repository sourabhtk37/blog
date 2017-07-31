server {
  listen  80;

  server_name blog.sourabhtk37.com;

  return 301 https://blog.sourabhtk37.com$request_uri; 

}

server {
        listen 443 ssl;
        server_name blog.sourabhtk37.com;

        root /var/www/blog.sourabhtk37.com/public;
       	#index index.html index.htm;
	
        ssl_certificate /path/to/full chain;
        ssl_certificate_key /path/to/private key;
	
	location / {
   		default_type "text/html";
   		try_files $uri.html $uri $uri/ /index.html;
  	}

	location ~/.well-known {
   		root /var/www/blog.sourabhtk37.com/public;
  	}
}
