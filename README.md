# cl-alexandria-pure

Common utility functions for Common Lisp with ZERO external dependencies.

A pure CL implementation of essential utilities inspired by Alexandria.

## Installation

```lisp
(asdf:load-system :cl-alexandria-pure)
```

## API

### Control Flow
- `when-let`, `when-let*` - Bind and execute if non-nil
- `if-let`, `if-let*` - Bind and branch on nil

### Lists
- `ensure-list` - Wrap non-lists in a list
- `flatten` - Flatten nested lists
- `mappend` - Map and append results
- `lastcar` - Last element of a list
- `proper-list-p` - Check for proper list
- `circular-list-p` - Check for circular list

### Functions
- `curry`, `rcurry` - Partial application
- `compose` - Function composition

### Macros
- `with-gensyms` - Bind gensyms for macro hygiene
- `once-only` - Evaluate forms once

### Hash Tables
- `hash-table-keys` - Get all keys
- `hash-table-values` - Get all values
- `alist-hash-table` - Convert alist to hash table
- `copy-hash-table` - Deep copy hash table

### Sequences
- `shuffle` - Random shuffle
- `random-elt` - Random element
- `iota` - Generate integer sequence

### Symbols
- `make-keyword` - Create keyword from string
- `symbolicate` - Concatenate symbols

## License

BSD-3-Clause. Copyright (c) 2024-2026 Parkian Company LLC.
