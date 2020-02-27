server {
    listen      %ip%:%web_port%;
    server_name %domain_idn% %alias_idn%;
    root        %docroot%/public;
    index       index.php index.html index.htm;
    access_log  off;
    # access_log  /var/log/nginx/domains/%domain%.log combined;
    # access_log  /var/log/nginx/domains/%domain%.bytes bytes;
    error_log   /var/log/nginx/domains/%domain%.error.log error;
    location / {
        try_files $uri $uri/ /index.php?_url=$uri&$args;
        location ~* ^.+\.(jpeg|jpg|png|gif|bmp|ico|svg|css|js)$ {
            expires         max;
            log_not_found   off;
            access_log      off;
        }

        location ~ [^/]\.php(/|$) {
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            if (!-f $document_root$fastcgi_script_name) {
                return  404;
            }

            fastcgi_pass    %backend_lsnr%;
            fastcgi_index   index.php;
            include         /etc/nginx/fastcgi_params;
            fastcgi_connect_timeout 250;
            fastcgi_send_timeout 250;
            fastcgi_read_timeout 250;
            fastcgi_buffer_size 256k;
            fastcgi_buffers 4 256k;
            fastcgi_busy_buffers_size 256k;
            fastcgi_temp_file_write_size 256k;
            fastcgi_intercept_errors on;
        }
    }

    error_page  403 /error/404.html;
    error_page  404 /error/404.html;
    error_page  500 502 503 504 /error/50x.html;

    location /error/ {
        alias   %home%/%user%/web/%domain%/document_errors/;
    }

    location ~* "/\.(htaccess|htpasswd)$" {
        deny    all;
        return  404;
    }

    location /vstats/ {
        alias   %home%/%user%/web/%domain%/stats/;
        include %home%/%user%/conf/web/%domain%.auth*;
    }

    include     %home%/%user%/conf/web/nginx.%domain%.conf*;
}
