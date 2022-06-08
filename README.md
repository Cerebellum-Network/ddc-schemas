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

**Other serializations** such as binary ProtoBuf and SCALE should follow this format:

    ddc_prefix message_type message_body

* The **ddc_prefix** represents the DDC namespace.
  It is the two bytes: **`0xD00C`**

* The **message_type** is the number of the message type in the table below.
  It is a ProtoBuf varint, that is one byte for numbers up to 127.

* The **message body** is encoded as implied by the message type, usually a ProtoBuf binary encoding.

Note: the prefix and type are equivalent to the following ProtoBuf field:

    uint32 message_type = 202;


### Message types

Number | Prefix (hex) | Encoding      | Description
------ | ------------ | ------------- | ------------------------
0      | 0xD00C00     |               | reserved
1      | 0xD00C01     | protobuf      | [SignedPiece](storage/protobuf/signed_piece.proto)
2      | 0xD00C02     | protobuf      | [SearchResult](storage/protobuf/search_result.proto)
3      | 0xD00C03     | protobuf      | [ClusterParams](contract-params/protobuf/cluster-params.proto)
4      | 0xD00C04     | protobuf      | [NodeParams](contract-params/protobuf/node-params.proto)


## Generating the documentation of the schemas

The documentation is generated from the interface definitions in this repo. Refresh it with this command:

    make docs

Find the result in `build/docs/` and synchronize it with the [source of docs.cere.network](https://github.com/Cerebellum-Network/docs.cere.network)


## Generating code from the schemas

It is recommended to use code generated from the interface definitions.

See the example for JavaScript in the Makefile: `make js`

Or see a project-specific setup, for example, in the [Go SDK](https://github.com/Cerebellum-Network/cere-ddc-sdk-go).

Whatever you do, please refer to specific versions of this ddc-schemas repository (git tags).
