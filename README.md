# DDC Schemas

This repository contains the interface definitions of DDC protocols.
The documentation is hosted at [docs.cere.network](https://docs.cere.network).


## Message serialization

Objects and messages stored in DDC nodes and smart contracts are serialized in JSON, in ProtoBuf,
or in SCALE. The serialization method in DDC aims for the following goals:

* to support the evolution of DDC protocols and stored data,
* to detect errors and incompatible components,
* to support polymorphic objects (multiple types) without relying on transport-specific methods,
* to be interoperable with other systems such as multicodec, IPFS, or ENS.


### Specification

This is achieved by using the following specification:

**JSON serializations** must start with `{`, `[`, or `"` (not a number or a space), in UTF-8, in order to be recognizable and upgradeable by future components.

**Binary serializations** such as binary ProtoBuf and SCALE should start the message with a type field, like so:

    type_key type_number message_body

* The **type_key** is a recognizable marker of the type field. It represents the namespace of DDC message types. It is the two bytes: **`0xD00C`**

* The **type_number** is the number of the message type in the table below.
  It is a ProtoBuf varint, e.g., one byte for numbers up to 127.

* The **message_body** is encoded as implied by the message type, usually a ProtoBuf binary encoding.

Note: This format is compatible with ProtoBuf. Parsers that do not know about the type field will simply ignore it; technically they will decode an optional ProtoBuf field `uint64 type_number = 202;`. Parsers that expect the type field, but see a message without it, can assume a default behavior.


### Message types

Number | Type Field (hex) | Serialization | Description
------ | ---------------- | ------------- | -----------
0      | 0xD00C00         |               | reserved
1      | 0xD00C01         | protobuf      | [SignedPiece](storage/protobuf/signed_piece.proto)


## Generating the documentation of the schemas

The documentation is generated from the interface definitions in this repo. Refresh it with this command:

    make docs

Find the result in `build/docs/` and synchronize it with the [source of docs.cere.network](https://github.com/Cerebellum-Network/docs.cere.network)


## Generating code from the schemas

It is recommended to use code generated from the interface definitions.

See the example for JavaScript in the Makefile: `make js`

Or see a project-specific setup, for example, in the [Go SDK](https://github.com/Cerebellum-Network/cere-ddc-sdk-go).

Whatever you do, please refer to specific versions of this ddc-schemas repository (git tags).
