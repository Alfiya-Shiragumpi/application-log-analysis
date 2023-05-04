#!/bin/bash
set -ev

for arch in amd64 s390x
do
	docker buildx build --platform=linux/${arch} --progress=plain \
		-t ${NAMESPACE_SOS}/${IMAGE_NAME}:${TRAVIS_COMMIT}-${arch} . --load
    docker push ${IMAGE_PUSH_NAME}-${arch}
done

