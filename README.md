# postgresql-cube

A library that adds [`cube`](TODO, postgresql cube docs) support to [`postgresql-simple`](TODO)

With this library, it is possible to write things like `Cube[[1, 2, 3], [4, 5, 6]]` as part of query templates. It does *not* provide the ability to parse `Cube`s from returned SQL, mainly because it looks hard and I don't need it for my use cases. I may get around to it at some point, but patches welcome in the meanwhile.

## Usage

Simply use `Cube` as you would any other query parameter.

```haskell
execute "INSERT INTO table(cube_field, name) VALUES(?, ?) RETURNING id" (Cube [[1, 2, 3]], "Testing")
executeMany "INSERT INTO table(cube_field, name) VALUES(?, ?) RETURNING id"
            [(Cube [[1, 2]], "One"), (Cube [[3, 4]], "Two"), (Cube [[5, 6]], "Three")]
```
