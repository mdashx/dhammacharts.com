run:
	hugo server

build:
	hugo

.PHONY: deploy
deploy: build
	ssh ${USER}@${HOST} 'mkdir -p ${WORKING_DIR}/html/'
	rsync -avzh --delete public/* ${USER}@${HOST}:/home/${USER}/${WORKING_DIR}/html
	ssh ${USER}@${HOST} 'sudo rsync --recursive --delete ${WORKING_DIR}/html/ /usr/share/nginx/html/${HOST_DOMAIN}/'
