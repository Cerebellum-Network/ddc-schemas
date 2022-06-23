
## Serialization in DDC

Objects and messages stored in DDC nodes and smart contracts are serialized in JSON, in ProtoBuf,
or in SCALE. The serialization method in DDC aims for the following goals:

* to detect errors and incompatible components,
* to support the evolution of DDC protocols and stored data,
* to implement polymorphic objects (multiple types) through various interfaces and stores,
* to be interoperable with other systems such as multicodec, IPFS, or ENS.

This is achieved by using the following specification.


### JSON

JSON serialization is used normally, but JSON messages must start with `{`, `[`, or `"`, in UTF-8, not a number or spacing, in order to be recognizable and upgradeable by future components.


### Binary with an implicit type

Binary serialization such as ProtoBuf may be used normally, but it must not emit messages that start with the reserved type tag **`0xD00C`** (see below). That is the case for ProtoBuf. The relevant documentation must specify what message type to use by default based on the context, and this default should not change.


### Binary with an explicit type

Binary serializations should start the message with a type field, like so:

    type_tag || type_number || message_body

* The **type_tag** is a recognizable marker of the type field. It represents the namespace of DDC message types. It is the two bytes: **`0xD00C`**

* The **type_number** is the number of the message type in the table below.
  It is a ProtoBuf varint, e.g., one byte for numbers up to 127.

* The **message_body** is encoded as implied by the message type, usually a ProtoBuf binary encoding.

The type field is compatible with ProtoBuf binary serialization and it is optional unless stated otherwise. Readers that do not know about the type field will simply ignore it; technically they will decode an optional ProtoBuf field `uint64 type_number = 202`. Readers that expect the type field, but see a message without it, must assume a default behavior which should not change.


### Known Message Type Tags

Number | Type Field (hex) | Serialization | Description
------ | ---------------- | ------------- | -----------
0      | 0xD00C00         |               | reserved
1      | 0xD00C01         | protobuf      | [SignedPiece](storage/protobuf/signed_piece.proto)

