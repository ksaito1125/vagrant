ls:
	docker images

ps:
	docker ps -a

run:
	docker run -itd -p 8080:80 --name svn ubuntu/svn

rm:
	-docker stop svn
	docker rm svn

build:
	docker build -t ubuntu/svn .

rmi:
	docker rmi ubuntu/svn

