type t = int
val compare : t -> t -> Ordering.t
val equal : t -> t -> bool
val hash : t -> int
val to_sexp : t -> Sexp.t

module Set : Set.S with type elt = t
module Map : Map.S with type key = t

val of_string_exn : string -> t
val of_string : string -> t option

val to_string : t -> string

module Infix : Comparable.OPS with type t = t

val max_value : t
