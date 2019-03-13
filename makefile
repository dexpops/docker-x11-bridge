all: build run log

run:
	docker stop x11-bridge; \
	docker run --rm -d \
	 --name x11-bridge \
	 -e MODE="tcp" \
	 -e XPRA_HTML="yes" \
	 -e XPRA_MMAP="yes" \
	 -e DISPLAY=":14" \
	 -p 10000:10000 \
	 dexpops/docker-x11-bridge:latest

log:
	docker logs -f x11-bridge

stop:
	docker stop x11-bridge

build:
	docker build -t dexpops/docker-x11-bridge:latest .