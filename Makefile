init:
	git submodule init && git submodule update
prep:
	cd swagger-codegen && mvn package
python:
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l python -o ../clients/python
php:
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l php -o ../clients/php
typescript-node:
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l typescript-node -o ../clients/typescript-node
	cd clients/typescript-node && tsc api.ts || false
javascript:
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l javascript -o ../clients/javascript

clients: python php typescript-node javascript
