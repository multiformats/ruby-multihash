# Changelog

## 0.2.0

- Add `multicodecs` (ruby-multicodec) which adds _all_ the current multihash
  codecs to this gem.
- Add a test to show the breaking changes

### Breaking changes:

The official codec table does not match the initial (`0.1.x`) multihash mapping.

`0x14` used to be named `sha3` and is now named `sha3-512`
`0x40` used to be named `blake2b` and is now not assigned
`0x41` used to be named `blake2s` and is now not assigned

`blake2b` consists of 64 output lengths that give different hashes
| name        | code   |
|-------------|--------|
| blake2b-8   | 0xb201 |
| blake2b-16  | 0xb202 |
| blake2b-24  | 0xb203 |
| ...         |        |
| blake2b-504 | 0xb23f |
| blake2b-512 | 0xb240 |

`blake2s` consists of 32 output lengths that give different hashes
| name        | code   |
|-------------|--------|
| blake2s-8   | 0xb241 |
| blake2s-16  | 0xb242 |
| blake2s-24  | 0xb243 |
| ...         |        |
| blake2s-248 | 0xb25f |
| blake2s-256 | 0xb260 |
