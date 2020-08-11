.PHONY: build

build:
	docker build -t microinfrastructure/gridftp-server:3938873 .

push: build
	docker push microinfrastructure/gridftp-server:3938873

run: build
	docker run -it  microinfrastructure/gridftp-server:3938873 sh

