build:
	GOOS=linux GOARCH=amd64 go build -tags lambda.norpc -o bootstrap main.go

run:
	docker run --rm -p 9000:8080 -v ${PWD}:/var/runtime amazon/aws-lambda-provided bootstrap

call:
	curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"httpMethod": "POST", "path": "/hello", "payload":"hello world!"}'	