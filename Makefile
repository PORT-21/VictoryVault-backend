install_swagger_cli:
	npm i -g swagger-cli

bundle_swagger:
	swagger-cli bundle ./openapi/api.yaml --outfile _build/openapi.yaml --type yaml

