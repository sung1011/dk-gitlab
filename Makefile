
# var define
GITLAB_RUNNER_VERSION=14.0.1
GITLAB_RUNNER_TAG=test
GITLAB_RUNNER_NAME=runner-1

help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  reg				todo"
	@echo "  up				todo"
	@echo "  down				todo"

.PHONY: up
up:
	@docker compose up -d
	@docker compose logs -f

.PHONY: down
down:
	@docker compose down -v
	@docker container prune -f
	@docker image prune -f
	@make clean

.PHONY: restart 
	@make up
	@make down

.PHONY: clean
clean:
	@rm -rf ./gitlab/config && mkdir ./gitlab/config
	@rm -rf ./gitlab/data && mkdir ./gitlab/data
	@rm -rf ./gitlab/logs && mkdir ./gitlab/logs


.PHONY: reg
reg:
	@docker exec -it ci-runner gitlab-runner register

# @docker exec -it ci-runner gitlab-runner register\
#   --non-interactive \
#   --registration-token "PROJECT_REGISTRATION_TOKEN" \
#   --url "https://git.panlonggame.com/" \
#   --executor "shell" \
#   --tag-list $(GITLAB_RUNNER_TAG) \
#   --name $(GITLAB_RUNNER_NAME)

.PHONY: unreg
unreg:
	@docker exec -it ci-runner gitlab-runner unregister --name $(GITLAB_RUNNER_NAME)

.PHONY: logs
logs:
	@docker compose logs -f