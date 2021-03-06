# DDC Schemas

This repository contains the interface definitions of DDC protocols.
The documentation is hosted at [docs.cere.network](https://docs.cere.network).


## Generating the documentation of the schema

The documentation is generated from the interface definitions in this repo. Refresh it with this command:

    make docs

Find the result in `build/docs/` and synchronize it with the [source of docs.cere.network](https://github.com/Cerebellum-Network/docs.cere.network)


## Generating code

It is recommended to use code generated from the interface definitions.

See the example for JavaScript in the Makefile: `make js`

Or see a project-specific setup, for example, in the [Go SDK](https://github.com/Cerebellum-Network/cere-ddc-sdk-go).

Whatever you do, please refer to specific versions of this ddc-schemas repository (git tags).


## Test vectors

Test values and their serialized forms are given in the `test-vectors` folder. These files were generated from test code of the respective SDKs. They can be used to test for regressions or compatibility between different components at different versions.
