.PHONY: build

build:
	docker build -t microinfrastructure/gridftp:3938873 .

push: build
	docker push microinfrastructure/gridftp:3938873

run: build
	docker run -it  microinfrastructure/gridftp:3938873 sh

