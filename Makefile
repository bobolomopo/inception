NAME = inception

all: prune reload

linux:
	@ sudo sh -c 'echo "127.0.0.1 jandre.42.be" >> /etc/hosts'
	
stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf ~/Desktop/inception

prune: clean
	@ docker system prune -f

reload: 
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: linux stop clean prune reload all
