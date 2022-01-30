build:
	GOOS=linux GOARCH=amd64 go build -o main main.go

run:
	docker run --rm -e LAMBDA_TASK_ROOT=/app -p 9000:8080 -v ${PWD}:/app amazon/aws-lambda-go main

call:
	curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'	