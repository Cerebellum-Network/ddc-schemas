## Changelog

### vNext
- `SignedPiece.piece` is embedded as a serialized message.
- Improved security and performance of signed upload requests.

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


