.PHONY: build-RuntimeDependenciesLayer build-lambda-common
.PHONY: build-HelloWorldFunction

CP                   := cp
CP_R                 := cp -r
DIST_MAIN            := dist/main
ARTIFACTS_DIR_NODEJS := "$(ARTIFACTS_DIR)/nodejs"

ifeq ($(OS),Windows_NT)
	ifeq ($(MSYSTEM),)
		CP                   := xcopy
		CP_R                 := xcopy /S
		DIST_MAIN            := dist\main
		ARTIFACTS_DIR_NODEJS := "$(ARTIFACTS_DIR)\nodejs"
	endif
endif

build-HelloWorldFunction:
	$(MAKE) CONFIG=tsconfig.main.json DIST=$(DIST_MAIN) build-lambda-common

build-lambda-common:
	npm install --no-bin-links 
	npm run build -- --project $(CONFIG)
	$(CP_R) $(DIST) $(ARTIFACTS_DIR)

build-RuntimeDependenciesLayer:
	mkdir -p $(ARTIFACTS_DIR_NODEJS)
	$(CP) package.json $(ARTIFACTS_DIR_NODEJS)
	$(CP) package-lock.json $(ARTIFACTS_DIR_NODEJS)
	(cd $(ARTIFACTS_DIR_NODEJS) && npm install --production)
	
