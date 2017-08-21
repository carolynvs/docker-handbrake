IMG="carolynvs/handbrake"
HANDBRAKE_VERSION="v1.7.5"

default:
	echo "Choose the form of the destructor"

build:
	docker build -t ${IMG}:${HANDBRAKE_VERSION} -t ${IMG}:latest .

push: build
	docker push ${IMG}:latest

run: build
	-docker rm -f handbrake
	docker run -d \
	    --name=handbrake \
	    -p 5800:5800 \
	    -p 5900:5900 \
	    -v `pwd`/watch:/watch:rw \
	    -v `pwd`/output:/output:rw \
	    -e AUTOMATED_CONVERSION_PRESET=tivo \
	    -e AUTOMATED_CONVERSION_FORMAT=mkv \
	    ${IMG}

debug: build
	docker run -it --rm \
	    -v `pwd`/watch:/watch:rw \
	    -v `pwd`/output:/output:rw \
	    -e AUTOMATED_CONVERSION_PRESET=tivo \
	    -e AUTOMATED_CONVERSION_FORMAT=mkv \
	    ${IMG} \
			sh

PHONY: build run debug deploy tail
