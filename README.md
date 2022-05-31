## Generate code

    PROJECT=storage

    docker run --rm                                                     \
        -v $PWD:/repo -w /repo                                          \
        jaegertracing/protobuf:0.3.1                                    \
            --experimental_allow_proto3_optional                        \
            --proto_path=$PROJECT/protobuf $PROJECT/protobuf/*.proto    \
            --js_out=build/js/$PROJECT                                  \
            --go_out=build/go/$PROJECT

## Generate docs

    PROJECT=storage
    
    docker run --rm                                 \
        -v $PWD/build/docs:/out                     \
        -v $PWD/$PROJECT/protobuf:/protos           \
        pseudomuto/protoc-gen-doc:1.5               \
            --doc_opt=markdown,$PROJECT-protobuf.md
