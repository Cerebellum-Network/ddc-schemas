# Storage Schema

This is the data model for the API of DDC Storage.


## Serialization in DDC

Objects and messages stored in DDC nodes and smart contracts are serialized in JSON, in ProtoBuf,
or in SCALE. The serialization method in DDC aims for the following goals:

* to detect errors and incompatible components,
* to support the evolution of DDC protocols and stored data,
* to implement polymorphic objects (multiple types) through various interfaces and stores,
* to be interoperable with other systems such as multicodec, IPFS, or ENS.


### Type Fields

This is achieved by using the following specification:

**JSON serializations** are done normally, but JSON messages must start with `{`, `[`, or `"`, not a number or a space, in UTF-8, in order to be recognizable and upgradeable by future components.

**Binary serializations** such as binary ProtoBuf and SCALE should start the message with a type field, like so:

    type_tag || type_number || message_body

* The **type_tag** is a recognizable marker of the type field. It represents the namespace of DDC message types. It is the two bytes: **`0xD00C`**

* The **type_number** is the number of the message type in the table below.
  It is a ProtoBuf varint, e.g., one byte for numbers up to 127.

* The **message_body** is encoded as implied by the message type, usually a ProtoBuf binary encoding.

The type field is compatible with ProtoBuf binary serialization and it is optional. Parsers that do not know about the type field will simply ignore it; technically they will decode an optional ProtoBuf field `uint64 type_number = 202;`. Parsers that expect the type field, but see a message without it, can assume a default behavior.


### Message Types

Number | Type Field (hex) | Serialization | Description
------ | ---------------- | ------------- | -----------
0      | 0xD00C00         |               | reserved
1      | 0xD00C01         | protobuf      | [SignedPiece](storage/protobuf/signed_piece.proto)




([Source](https://github.com/Cerebellum-Network/ddc-schemas))


