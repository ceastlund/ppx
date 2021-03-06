#require "ppx.ast"
#require "ppx.ast_deprecated"
open Ppx

let foo =
  Deriving.add "foo"
    ~str_type_decl:(Deriving.Generator.make_noarg
                      (fun ~loc ~path:_ _ ->
                         [%str let x = 42]))
    ~sig_type_decl:(Deriving.Generator.make_noarg
                      (fun ~loc ~path:_ _ ->
                         [%sig: val y : int]))
[%%expect{|
val foo : Deriving.t = <abstr>
|}]

let bar =
  Deriving.add "bar"
    ~str_type_decl:
      (Deriving.Generator.make_noarg ~deps:[foo] (fun ~loc ~path:_ _ ->
         [%str let () = Printf.printf "x = %d\n" x]))
[%%expect{|
val bar : Deriving.t = <abstr>
|}]

let mtd =
  Deriving.add "mtd"
    ~sig_module_type_decl:(
      Deriving.Generator.make_noarg
        (fun ~loc ~path:_ _ ->
           [%sig: val y : int]))
    ~str_module_type_decl:(
      Deriving.Generator.make_noarg
        (fun ~loc ~path:_ _ ->
           [%str let y = 42]))
[%%expect{|
val mtd : Deriving.t = <abstr>
|}]

type t = int [@@deriving bar]
[%%expect{|
Line _, characters 25-28:
Error: Deriver foo is needed for bar, you need to add it before in the list
|}]

type t = int [@@deriving bar, foo]
[%%expect{|
Line _, characters 25-33:
Error: Deriver foo is needed for bar, you need to add it before in the list
|}]

type t = int [@@deriving foo, bar]
[%%expect{|
type t = int
val x : int = 42
|}]

module Foo_sig : sig
  type t [@@deriving foo]
end = struct
  type t
end
[%%expect{|
Line _, characters 6-25:
Error: Signature mismatch:
       Modules do not match:
         sig type t end
       is not included in
         sig type t val y : int end
       The value `y' is required but not provided
       File "test/deriving/test.ml", line 3, characters 2-25:
         Expected declaration
|}]

module type X = sig end [@@deriving mtd]
[%%expect{|
module type X = sig  end
val y : t = 42
|}]

module Y : sig
  module type X = sig end [@@deriving mtd]
end = struct
  module type X = sig end
  let y = 42
end
[%%expect{|
module Y : sig module type X = sig  end val y : t end
|}]
