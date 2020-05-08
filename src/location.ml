open Import

type t = Astlib.Location.t =
  { loc_start : Astlib.Position.t
  ; loc_end   : Astlib.Position.t
  ; loc_ghost : bool
  }

let in_file name =
  let pos : Astlib.Position.t =
    { pos_fname = name
    ; pos_lnum  = 1
    ; pos_bol   = 0
    ; pos_cnum  = -1
    }
  in
  { loc_start = pos
  ; loc_end   = pos
  ; loc_ghost = true
  }

let none = in_file "_none_"

let raise_errorf ?loc fmt = Astlib.Location.raise_errorf ?loc fmt
let report_exception = Astlib.Location.report_exception

let of_lexbuf (lexbuf : Lexing.lexbuf) =
  { loc_start = lexbuf.lex_start_p
  ; loc_end   = lexbuf.lex_curr_p
  ; loc_ghost = false
  }

let print ppf t =
  Format.fprintf ppf "File \"%s\", line %d, characters %d-%d:"
    t.loc_start.pos_fname
    t.loc_start.pos_lnum
    (t.loc_start.pos_cnum - t.loc_start.pos_bol)
    (t.loc_end.pos_cnum   - t.loc_start.pos_bol)

type 'a loc = 'a Astlib.Loc.t =
  { txt : 'a
  ; loc : t
  }

module Error = struct
  type t = Astlib.Location.error

  let createf ~loc fmt = Astlib.Location.errorf ~loc fmt

  let message (t : t) = t.msg
  let set_message (t : t) msg = { t with msg }

  let register_error_of_exn = Astlib.Location.register_error_of_exn

  let of_exn = Compiler_specifics.error_of_exn

  let rec to_extension (t : t) =
    let loc = t.loc in
    let str s =
      { pstr_loc  = loc
      ; pstr_desc =
          Pstr_eval
            ({ pexp_loc = loc
             ; pexp_attributes = []
             ; pexp_desc = Pexp_constant (Pconst_string (s, None))
             }, [])
      }
    in
    ({ loc = t.loc; txt = "ocaml.error" },
     PStr (str t.msg          ::
           str t.if_highlight ::
           List.map t.sub ~f:(fun t ->
             { pstr_loc = loc
             ; pstr_desc = Pstr_extension (to_extension t, [])
             })))
end

exception Error of Error.t

let () =
  Printexc.register_printer (function
    | Error e -> Some (Error.message e)
    | _ -> None)
