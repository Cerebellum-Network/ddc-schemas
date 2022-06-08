# DDC Schemas

This repository contains the interface definitions of DDC protocols.
The documentation is hosted at [docs.cere.network](https://docs.cere.network).


## Message serialization

Messages and stored objects in DDC are serialized in JSON, in ProtoBuf, or in SCALE.
The serialization method in DDC aims for the following goals:

* to support the evolution of DDC protocols and stored data,
* to detect errors and incompatible components,
* to support polymorphic objects (multiple types) without relying on transport-specific methods,
* to be interoperable with other systems such as multicodec, IPFS, or ENS.


### Specification

This is achieved by using the following specification:

**JSON serializations** must start with `{`, `[`, or `"` (not a number or a space), in UTF-8, in order to be recognizable and upgradeable by future components.

**Other serializations** such as binary ProtoBuf and SCALE should follow this format:

    ddc_prefix type_number message_body

* The **ddc_prefix** represents the DDC namespace.
  It is the three bytes: **`0xDDC201`**

* The **type number** represents the message type from the table below.
  It is a protobuf varint, that is one byte for numbers up to 127.

* The **message body** is encoded as implied by the message type, usually a protobuf binary encoding.


### Message types

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
