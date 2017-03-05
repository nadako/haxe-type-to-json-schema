all:
	haxe build.hxml
	haxe build-demo.hxml
	neko bin/main.n

