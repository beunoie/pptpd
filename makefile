#########################################
#VARIABLES: CAN BE EDITED
#########################################

CONTAINER=pptpd

CONTNAME=$(CONTAINER)-1

DATAVOL=/home/docker/$(CONTAINER)/vol

STARTOPT=-d \
--privileged -p 1723:1723 \
--name $(CONTNAME) \
$(CONTAINER)


#########################################
# ACTIONS: DO NOT EDIT BEYOND THIS POINT
#########################################

build:
	docker build -t $(CONTAINER) .

run:
	docker run $(STARTOPT)

bash:
	docker exec -i -t $(CONTNAME) /bin/sh

stop:
	docker stop $(CONTNAME)

start:
	docker start $(CONTNAME)

delete:
	docker rm $(CONTNAME)

clear:
	docker rmi -f $(CONTAINER)

install:
	docker run --restart=always $(STARTOPT)

cleanupdb:
	make stop;make delete

restart:
	 make stop;make delete ;make build ;make run
