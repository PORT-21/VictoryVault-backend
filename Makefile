install_npm_dependencies:
	npm i -g swagger-cli
	npm install openapi-typescript-codegen --save-dev

bundle_swagger:
	swagger-cli bundle ./openapi/api.yaml --outfile _build/openapi.yaml --type yaml

generate_typescript_lib:
	npm run generate-client --prefix ./frontend

generate_fastapi:
	make bundle_swagger
	fastapi-codegen --input _build/openapi.yaml --output _app
	make generate_typescript_lib
