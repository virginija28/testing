PLUGIN_FILE_NAME:= "hostinger.zip"

PHONY: clean-release
clean-release:
	@echo "Cleaning release file"
	rm -rf ./build/hostinger*
	rm -f ./build/hostinger*.zip

PHONY: build-release
build-release: clean-release
	@echo "Building release:" $(PLUGIN_FILE_NAME)\
	&& PLUGIN_NAME=$(PLUGIN_FILE_NAME)\
	&& cd ./build && mkdir hostinger\
	&& rsync -r --exclude 'build' --exclude 'node_modules' --exclude 'assets/mix-manifest.json' --exclude 'docker-compose.yml' --exclude 'changelog.txt' --exclude 'changelog.md'  --exclude 'readme.md' --exclude 'bin' --exclude 'Dockerfile' --exclude 'phpunit.xml.dist' --exclude 'tests' --exclude 'vendor' --exclude 'composer.json' --exclude 'composer.lock' ../* hostinger\
	&& zip --verbose -r -x=@../.zipignore $$PLUGIN_NAME hostinger/*\
	&& rm -rf hostinger
