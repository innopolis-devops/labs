###--VARIABLES--########################################################################################################

AWS_ACCOUNT=553667903818
AWS_REPOSITORIES_REGION=eu-north-1

SERVICE_NAME=app_python
CONTAINERS=api watchtower

########################################################################################################################

###--CONSTANTS--########################################################################################################

AWS_ECR_URL=$(AWS_ACCOUNT).dkr.ecr.$(AWS_REPOSITORIES_REGION).amazonaws.com
AWS_ECR_SERVICE_URL=$(AWS_ECR_URL)/$(SERVICE_NAME)

########################################################################################################################

###--SERVICE--##########################################################################################################

dev:
	TAG=dev NAMESPACE=${NAMESPACE} make _server

prod:
	TAG=prod NAMESPACE=${NAMESPACE} make _server

local:
	touch .env
	touch .env.priority
	AWS_ECR_SERVICE_URL=${AWS_ECR_SERVICE_URL} TAG=dev \
		docker compose -f docker-compose-base.yml -f docker-compose-local.yml up -d
dev-local:
	TAG=dev NAMESPACE=${NAMESPACE} make _local

prod-local:
	TAG=prod NAMESPACE=${NAMESPACE} make _local

stop:
	AWS_ECR_SERVICE_URL=${AWS_ECR_SERVICE_URL} TAG=${TAG} \
	docker compose -f docker-compose-base.yml -f docker-compose-server.yml -f docker-compose-local.yml stop

down:
	AWS_ECR_SERVICE_URL=${AWS_ECR_SERVICE_URL} TAG=${TAG} \
	docker compose -f docker-compose-base.yml -f docker-compose-server.yml -f docker-compose-local.yml down

down-v:
	AWS_ECR_SERVICE_URL=${AWS_ECR_SERVICE_URL} TAG=${TAG} \
	docker compose -f docker-compose-base.yml -f docker-compose-server.yml -f docker-compose-local.yml down -v

env:
	touch .env
	touch .env.priority
	python3 utils/get_environment.py ${SERVICE_NAME} ${TAG} ${NAMESPACE} > .env

_local:
	TAG=${TAG} NAMESPACE=${NAMESPACE} make env
	AWS_ECR_SERVICE_URL=${AWS_ECR_SERVICE_URL} TAG=${TAG} \
		docker compose -f docker-compose-base.yml -f docker-compose-local.yml up -d

_server:
	TAG=${TAG} NAMESPACE=${NAMESPACE} make env
	AWS_ECR_SERVICE_URL=${AWS_ECR_SERVICE_URL} TAG=${TAG} \
		docker compose -f docker-compose-base.yml -f docker-compose-server.yml up -d

########################################################################################################################

###--DOCKER--###########################################################################################################

prune:
	docker system prune -f

prune-v:
	docker volume prune -f

build-dev:
	TAG=dev make _build

build-prod:
	TAG=prod make _build

push-dev:
	TAG=dev make _push

push-prod:
	TAG=prod make _push

pull-dev:
	TAG=dev make _pull

pull-prod:
	TAG=prod make _pull

_build:
	for name in ${CONTAINERS}; \
		do docker build -t ${AWS_ECR_SERVICE_URL}/$${name}:${TAG} -f ./docker/$${name}.Dockerfile .; done

_push:
	for name in ${CONTAINERS}; \
		do docker push ${AWS_ECR_SERVICE_URL}/$${name}:${TAG}; done

_pull:
	for name in ${CONTAINERS}; \
		do docker pull ${AWS_ECR_SERVICE_URL}/$${name}:${TAG}; done

########################################################################################################################

###--AWS--##############################################################################################################

ecr_init:
	for name in ${CONTAINERS}; \
		do NAME=$${name} make _create_ecr_repository; done

ecr_login:
	aws ecr get-login-password --region ${AWS_REPOSITORIES_REGION} | docker login --username AWS \
		--password-stdin ${AWS_ECR_URL}

_create_ecr_repository:
	# For ignore error messages from command (-) is used.
	-aws ecr create-repository --repository-name ${SERVICE_NAME}/${NAME} \
		--region ${AWS_REPOSITORIES_REGION} >> /dev/null
	-aws ecr put-lifecycle-policy --repository-name ${SERVICE_NAME}/${NAME} \
		--region ${AWS_REPOSITORIES_REGION} --lifecycle-policy-text "file://config/ecr_policy.json" >> /dev/null

########################################################################################################################

###--LINT--#############################################################################################################

refactor:
	autoflake --in-place \
				--recursive \
				--remove-unused-variables \
				--remove-duplicate-keys \
				--remove-all-unused-imports \
				--ignore-init-module-imports \
				src/ utils/
	isort src/ utils/

lint:
	autoflake --in-place --recursive src/ utils/ --check
	isort src/ utils/ --check-only
	mypy --install-types --non-interactive src/ utils/
	flake8 src/ utils/

########################################################################################################################

###--TESTS--############################################################################################################

test:
	pytest tests/

########################################################################################################################
