module type S = Hashtbl_intf.S

module Make(Key : Hashable.S) : S with type key = Key.t

type ('a, 'b) t = ('a, 'b) MoreLabels.Hashtbl.t

val hash : 'a -> int

val create : ?random:bool -> int -> ('a, 'b) t

val reset : ('a, 'b) t -> unit

val remove : ('a, _) t -> 'a -> unit

val length : (_, _) t -> int

val iter : ('a, 'b) t -> f:(key:'a -> data:'b -> unit) -> unit

val replace : ('a, 'b) t -> key:'a -> data:'b -> unit

val add : ('a, 'b) t -> 'a -> 'b -> unit

val find : ('a, 'b) t -> 'a -> 'b option
val find_exn : ('a, 'b) t -> 'a -> 'b
val find_or_add : ('a, 'b) t -> 'a -> f:('a -> 'b) -> 'b

val fold  : ('a, 'b) t -> init:'c -> f:(      'b -> 'c -> 'c) -> 'c
val foldi : ('a, 'b) t -> init:'c -> f:('a -> 'b -> 'c -> 'c) -> 'c

val map : ('a, 'b) t -> f:('b -> 'c) -> ('a, 'c) t

val mem : ('a, _) t -> 'a -> bool

val keys : ('a, _) t -> 'a list

val to_sexp : ('a -> Sexp.t) -> ('b -> Sexp.t) -> ('a, 'b) t -> Sexp.t
val to_dyn : ('a -> Dyn.t) -> ('b -> Dyn.t) -> ('a, 'b) t -> Dyn.t

val of_list : ?size: int -> ('a * 'b) list -> [`Ok of ('a, 'b) t | `Duplicate_key of 'a]
val of_list_multi : ?size:int -> ('a * 'b) list -> ('a, 'b list) t
val of_list_exn : ?size:int -> ('a * 'b) list -> ('a, 'b) t
