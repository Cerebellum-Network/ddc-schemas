## Generate code

    docker run --rm -v $PWD:/x -w /x            \
        jaegertracing/protobuf:0.3.1            \
        --experimental_allow_proto3_optional    \
        --proto_path=protobuf protobuf/*.proto  \
        --js_out=build/js                       \
        --go_out=build/go
