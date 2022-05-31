## Generate code

    docker run --rm                             \
        -v $PWD:/repo -w /repo                        \
        jaegertracing/protobuf:0.3.1            \
            --experimental_allow_proto3_optional    \
            --proto_path=protobuf protobuf/*.proto  \
            --js_out=build/js                       \
            --go_out=build/go

## Generate docs

    docker run --rm                     \
        -v $PWD/build/docs:/out         \
        -v $PWD/protobuf:/protos        \
        pseudomuto/protoc-gen-doc:1.5   \
            --doc_opt=markdown,docs.md
