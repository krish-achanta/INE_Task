FROM ubuntu
COPY ./ ./
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y mysql-server
RUN apt-get install -y php libapache2-mod-php php-mysql
COPY ./dir.conf /etc/apache2/mods-enabled
RUN service apache2 restart
RUN apt install -y python3
RUN apt-get install -y python3-lxml
RUN unzip f922670e98bcbcff923d9bfaf430e669-qdPM_9.1.zip -d /var/www/html
RUN service apache2 restart
CMD ["mysql", "-u", "root", "-p", "toor","-e","CREATE", "DATABASE" ,"qdpm;"]
EXPOSE 80
CMD ["python3", "exploit.py", "-url", "http://localhost/", "--email", "task@task.com", "--password", "task"]







