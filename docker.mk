.PHONY: help install build clean uninstall
.PHONY: bash

IMAGE := hello-homebrew-linux

help:
	@cat $(firstword $(MAKEFILE_LIST))

instsall:
	@echo "nothing to do: $@"

build:
	docker build -t $(IMAGE) .

bash: build
	docker run -it --rm $(IMAGE) bash

clean:
	@echo "nothing to do: $@"

uninstall:
	docker image rm $(IMAGE)
