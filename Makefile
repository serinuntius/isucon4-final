#当日変更する
APP_USER=isucon

#固定
REPO=isucon4-final
SHELL=/bin/bash


.PHONY: help
help:
	@echo usage: make [command]
	@echo
	@echo command:
	@echo -e "sync : 全台に$(REPO)を配る\nall-chef : 全台でchefを回す" | column -t

.PHONY: sync
sync:
	sudo chown -R $(APP_USER) /home/$(APP_USER)/$(REPO)
	for i in {2..4}; do rsync --exclude .git -av /home/$(APP_USER)/$(REPO) isu$${i}:/home/$(APP_USER)/; done
	nssh -t isu1 -t isu2 -t isu3 -t isu4 chown -R /home/$(APP_USER)/$(REPO)

.PHONY: all-chef
all-chef:
	nssh -t isu1 -t isu2 -t isu3 -t isu4 /home/$(APP_USER)/$(REPO)/chef/run-chef.sh

.PHONY: build
build:
	cd /home/isucon/webapp/go && ./build.sh


.PHONY: deploy
deploy:
	make sync
	for i in {2..4}; do rsync --exclude .git -av /home/$(APP_USER)/isucon4-final/webapp/ isu$${i}:/home/$(APP_USER)/webapp/; done
