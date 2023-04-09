source_openapi_dest := ./openapi/api.yaml
bundled_openapi_dest := ./openapi/bundled_openapi.yaml


install_npm_dependencies:
	npm i -g swagger-cli

bundle_openapi:
	swagger-cli bundle $(source_openapi_dest) --outfile $(bundled_openapi_dest) --type yaml

generate_fastapi:
	make bundle_openapi
	fastapi-codegen --input $(bundled_openapi_dest) \
					--output ./app/ \
					--model-file dto
	mv ./app/main.py ./app/app.py
