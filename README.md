# DDC Schemas

This repository contains the interface definitions of DDC protocols.
The documentation is hosted at [docs.cere.network](https://docs.cere.network).


## Message encoding

Messages and objects in DDC are serialized as follows:

    ddc_prefix type_number message_body

* The **ddc_prefix** represents the DDC namespace.
  It is the three bytes: **`0xDDC201`**

* The **type number** represents the message type from the table below.
  It is a protobuf varint, that is one byte for numbers up to 127.

* The **message body** is encoded as specified by the message type, usually a protobuf binary encoding.

The purpose of this format is to support the evolution of DDC protocols, to detect errors, and to be compatible with other systems such as multicodec or ENS.


## Message types

Number | Prefix (hex) | Encoding      | Description
------ | ------------ | ------------- | ------------------------
0      | 0xDDC20100   |               | reserved
1      | 0xDDC20101   | protobuf      | [SignedPiece](storage/protobuf/signed_piece.proto)
2      | 0xDDC20102   | protobuf      | [SearchResult](storage/protobuf/search_result.proto)


## Generating the documentation of the schemas

The documentation is generated from the interface definitions in this repo. Refresh it with this command:

    make docs

Find the result in `build/docs/` and synchronize it with the [source of docs.cere.network](https://github.com/Cerebellum-Network/docs.cere.network)


## Generating code from the schemas

It is recommended to use code generated from the interface definitions.

See the example for JavaScript in the Makefile: `make js`

Or see a project-specific setup, for example, in the [Go SDK](https://github.com/Cerebellum-Network/cere-ddc-sdk-go).

Whatever you do, please refer to specific versions of this ddc-schemas repository (git tags).
