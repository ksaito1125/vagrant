ps:
	docker ps -a

run: build
	docker ps -a
	docker run -itd --name test01 docker/ansible /bin/bash
	docker inspect --format ' {{ .NetworkSettings.IPAddress }} ' test01
	docker run -itd --name test02 docker/ansible /bin/bash
	docker inspect --format ' {{ .NetworkSettings.IPAddress }} ' test02
	docker run -itd --name test03 docker/ansible /bin/bash
	docker inspect --format ' {{ .NetworkSettings.IPAddress }} ' test03
	docker ps -a
	@touch run

clean: rm rmi

build:
	docker images
	docker build -t docker/ansible .
	docker images
	@touch build

rm:
	docker ps -a
	-docker rm test01
	-docker rm test02
	-docker rm test03
	docker ps -a
	@rm -f run

rmi:
	docker images
	docker rmi docker/ansible
	docker images
	@rm -f build
