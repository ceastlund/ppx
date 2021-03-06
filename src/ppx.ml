(** Standard library for ppx rewriters *)

(** Make sure code using Ppx doesn't refer to compiler-libs without being explicit
    about it *)
include struct
  [@@@warning "-3"]
  open Ocaml_shadow

  include (Ocaml_shadow : module type of struct include Ocaml_shadow end
           with module Ast_helper   := Ast_helper
           with module Asttypes     := Asttypes
           with module Docstrings   := Docstrings
           with module Identifiable := Identifiable
           with module Lexer        := Lexer
           with module Location     := Location
           with module Longident    := Longident
           with module Parse        := Parse
           with module Parser       := Parser
           with module Parsetree    := Parsetree
           with module Pprintast    := Pprintast
           with module Syntaxerr    := Syntaxerr
          )
end (** @inline *)

(** Includes the overrides from Ppx_ast, as well as all the Ast definitions since we need
    them in every single ppx *)
include Ppx_ast

module Ast_builder         = Ast_builder
module Ast_pattern         = Ast_pattern
module Ast_traverse        = Ast_traverse
module Attr                = Attr
module Code_path           = Code_path
module Caller_id           = Caller_id
module Context_free        = Context_free
module Deriving            = Deriving
module Driver              = Driver
module Expansion_context   = Expansion_context
module Ext                 = Ext
module File_path           = File_path
module Loc                 = Loc
module Location            = Location
module Longid              = Longid
module Merlin_helpers      = Merlin_helpers
module Reserved_namespaces = Name.Reserved_namespaces
module Spellcheck          = Spellcheck
module Quoter              = Quoter

module Sexp : sig
  type t =
    | Atom of string
    | List of t list
end = Exposed_sexp

include Common

(**/**)

(* For tests and Ppx_core compatiblity layer *)
module Ppx_private = struct
  module Common = Common
  module Name   = Name
end
