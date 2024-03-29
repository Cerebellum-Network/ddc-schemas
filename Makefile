

docs: docs-storage docs-contract-params

docs-%:
	@echo "\nBuilding docs for schema ${*}...";

	docker run --rm                                										\
		-v ${PWD}:/repo                     											\
		rvolosatovs/protoc:3.3                      									\
			--proto_path=/repo/$*/protobuf												\
			--doc_out=/repo/build/tmp 													\
			--doc_opt=/repo/markdown.tmpl,$*-protobuf.md 								\
			$$(find $*/protobuf -name '*.proto' -type f | sed 's/.*\///' | sort);		\

	cat $*/README.md $*/CHANGELOG.md build/tmp/$*-protobuf.md > build/docs/$*-schema.md;

js: js-storage js-contract-params

js-%:
	@echo "\nBuilding JS code for schema $*...";

	docker run --rm                                 							\
		-v ${PWD}:/repo                     									\
		rvolosatovs/protoc:3.3                             						\
			--proto_path=/repo/$*/protobuf								\
			--js_out=/repo/build/js/$* 									\
			$$(find $*/protobuf -name '*.proto' -printf '%P\n' | sort);	

fix-docker-mess:
	sudo chown $$(whoami) -R build
