.PHONY: clean init prep python php typescript-node javascript clients

swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar:
	cd swagger-codegen && mvn -Dmaven.test.skip=true package

clean:
	cd swagger-codegen && mvn clean
	rm -rf clients/*
init:
	git submodule init && git submodule update

prep: swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar

python: prep
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l python -o ../clients/python

php: prep
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l php -o ../clients/php

typescript-node: prep
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l typescript-node -o ../clients/typescript-node
	cd clients/typescript-node && tsc api.ts || true

javascript: prep
	cd swagger-codegen && java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i ../insightsapi.yaml -l javascript -o ../clients/javascript

clients: python php typescript-node javascript
