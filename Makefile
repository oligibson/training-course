HUGO := hugo
GIT := git
ASSETS_DIR := assets/js/vendor/
PUBLIC_DIR := public

build-js:
	mkdir -p $(ASSETS_DIR)
	cp node_modules/jquery/dist/jquery.min.js $(ASSETS_DIR)
	cp node_modules/popper.js/dist/umd/popper.min.js $(ASSETS_DIR)
	cp node_modules/bootstrap/dist/js/bootstrap.min.js $(ASSETS_DIR)
build: build-js
	$(HUGO)
serve: build-js
	$(HUGO) server
deploy: build
	git --git-dir=./public/.git checkout master
	git --git-dir=./public/.git add .
	git --git-dir=./public/.git commit -m "Auto Deployment"
	git --git-dir=./public/.git push origin master