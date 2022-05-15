NAME = inception

all: reload

linux:
	@ sudo sh -c 'echo "127.0.0.1 jandre.42.fr" >> /etc/hosts'
	
stop:
	@ cd srcs && docker-compose down && cd ..

clean: stop
	@ sudo rm -rf ~/home/jandre/data/*

prune: clean
	@ docker system prune -fa
	@ docker volume rm -f srcs_website
	@ docker volume rm -f srcs_mariadb

reload: 
	@ cd srcs && docker-compose up --build --remove-orphan && cd ..

.PHONY: linux stop clean prune reload all
