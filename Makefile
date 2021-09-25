.PHONY: build-RuntimeDependenciesLayer build-lambda-common
.PHONY: build-HelloWorldFunction

CP                   := cp
CP_R                 := cp -r
RM_RF                := rm -rf
NODE_MODULES_BIN     := node_modules/.bin
DIST_MAIN            := dist/main
ARTIFACTS_DIR_NODEJS := "$(ARTIFACTS_DIR)/nodejs"

ifeq ($(OS),Windows_NT)
	ifeq ($(MSYSTEM),)
		CP                   := xcopy
		CP_R                 := xcopy /S
		RM_RF                := rmdir /S /Q
		NODE_MODULES_BIN     := node_modules\.bin
		DIST_MAIN            := dist\main
		ARTIFACTS_DIR_NODEJS := "$(ARTIFACTS_DIR)\nodejs"
	endif
endif

# edit or add for each your function. if want to isolate dist, change tsconfig and dist path.
build-HelloWorldFunction:
	$(MAKE) CONFIG=tsconfig.main.json DIST=$(DIST_MAIN) build-lambda-common

# when macOS, cannot resolve node_modules/.bin's symlink. so remove and reinstall
build-lambda-common:
	$(RM_RF) $(NODE_MODULES_BIN)
	npm install --no-bin-links 
	npm run build -- --project $(CONFIG)
	$(CP_R) $(DIST) $(ARTIFACTS_DIR)

build-RuntimeDependenciesLayer:
	mkdir -p $(ARTIFACTS_DIR_NODEJS)
	$(CP) package.json $(ARTIFACTS_DIR_NODEJS)
	$(CP) package-lock.json $(ARTIFACTS_DIR_NODEJS)
	(cd $(ARTIFACTS_DIR_NODEJS) && npm install --production)
	
