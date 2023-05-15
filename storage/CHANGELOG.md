## Changelog

### vNext
- Update Ask and Log records to v2, add chunk ids and signature
### v0.1.5
- Added Log Record model for logging Activity Capture
- Added Session Status model for Activity Capture
- Added Request and Response for API v1

### v0.1.4
- `SignedPiece.piece` is embedded as a serialized message.
    - No changes in the wire format.
    - This facilitates forward-compatibility and signature verification.
- Improved security and performance of signed upload requests.
    - The signature and the signer address do not need to be encoded in hexadecimal.
    - The signed message explains what is signed and is human-readable.
    - The signed message includes a timestamp.
- Added test vectors from the JS SDK.

### v0.1.3
- [Breaking] Return piece CIDs in `SearchResult`.
- Added the option `Query.skipData` to fetch piece metadata without payload data in search results.
- Added the option `Tag.searchable` to specify whether or not a tag should be indexed for fast search.
- `Tag.key` and `Tag.value` may contain bytes instead of only string.
- Added a table of known tags.

### v0.1.2

- Piece and query model.
- As implemented by the [Go SDK v0.1.2](https://github.com/Cerebellum-Network/cere-ddc-sdk-go/releases/tag/v0.1.2)
- Inline documentation.


