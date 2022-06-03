PROJECT=storage

docs:
	docker run --rm                                 \
		-v ${PWD}:/repo                     \
		rvolosatovs/protoc:3.3                             	\
			--proto_path=/repo/${PROJECT}/protobuf	\
			--doc_out=/repo/build/tmp 						\
			--doc_opt=markdown,${PROJECT}-protobuf.md \
			$$(find ${PROJECT}/protobuf -name '*.proto' -printf '%P\n' | sort)

	cat ${PROJECT}/README.md ${PROJECT}/CHANGELOG.md build/tmp/${PROJECT}-protobuf.md > build/docs/${PROJECT}-schema.md


js:
	docker run --rm                                 \
		-v ${PWD}:/repo                     \
		rvolosatovs/protoc:3.3                             	\
			--proto_path=/repo/${PROJECT}/protobuf	\
			--js_out=/repo/build/js/${PROJECT} 						\
			$$(find ${PROJECT}/protobuf -name '*.proto' -printf '%P\n' | sort)

fix-docker-mess:
	sudo chown $$(whoami) -R build
