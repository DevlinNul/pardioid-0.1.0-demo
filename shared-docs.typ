#import "utils.typ": extract-def, extract-doc

// #start stroke-types
-> none | auto | length | color | gradient | stroke | tiling | dictionary
// #end stroke-types

// #start fill-types
-> none | color | gradient | tiling
// #end fill-types

// #start stroke-config
A dictionary containing exactly `stroke-mode` and `base-stroke`.

`stroke-mode` is either #highlight("merge") or #highlight("cover").

`base-stroke` is the underlying stroke used for merging when `stroke-mode` is #highlight("merge"). When `stroke-mode` is #highlight("cover"), `base-stroke` has no effect.

The default `stroke-config` is defined as
#extract-def("style.typ", id: "default-stroke-config")
-> Stroke-config
// #end stroke-config

