(*$ open Ppxlib_cinaps_helpers $*)
open! Import
open Common

module E  = Ext
module EC = Ext.Context
module A  = Attr
module AC = Attr.Context

module Rule = struct
  module Attr_group_inline = struct
    type ('a, 'b, 'c, 'd) unpacked =
      { attribute : ('b, 'c) Attr.t
      ; expect    : bool
      ; expand    : (ctxt:Expansion_context.Deriver.t
                     -> Rec_flag.t
                     -> 'b list
                     -> 'c option list
                     -> 'd)
      }

    type ('a, 'b, 'c) t = T : ('a, 'b, _, 'c) unpacked -> ('a, 'b, 'c) t

    let attr_name (T t) = Attr.name t.attribute

    let split_normal_and_expect l = List.partition l ~f:(fun (T t) -> not t.expect)
  end

  module Attr_inline = struct
    type ('a, 'b, 'c, 'd) unpacked =
      { attribute : ('b, 'c) Attr.t
      ; expect    : bool
      ; expand    : (ctxt:Expansion_context.Deriver.t
                     -> 'b
                     -> 'c
                     -> 'd)
      }

    type ('a, 'b, 'c) t = T : ('a, 'b, _, 'c) unpacked -> ('a, 'b, 'c) t
    let attr_name (T t) = Attr.name t.attribute

    let split_normal_and_expect l = List.partition l ~f:(fun (T t) -> not t.expect)
  end

  module Special_function = struct
    type t =
      { name   : string
      ; ident  : Longid.t
      ; expand : expression -> expression option
      }
  end

  module Constant_kind = struct
    type t = Float | Integer
  end

  module Constant = struct
    type t =
      { suffix : char
      ; kind : Constant_kind.t
      ; expand : Location.t -> string -> expression
      }
  end

  module Field = struct
    type 'a t =
      | Extension          : Ext.t                                                  t
      | Special_function   : Special_function.t                                     t
      | Constant           : Constant.t                                             t
      | Attr_str_type_decl : (structure_item, type_declaration, structure) Attr_group_inline.t t
      | Attr_sig_type_decl : (signature_item, type_declaration, signature) Attr_group_inline.t t
      | Attr_str_module_type_decl : (structure_item, module_type_declaration, structure) Attr_inline.t t
      | Attr_sig_module_type_decl : (signature_item, module_type_declaration, signature) Attr_inline.t t
      | Attr_str_type_ext  : (structure_item, type_extension, structure) Attr_inline.t         t
      | Attr_sig_type_ext  : (signature_item, type_extension, signature) Attr_inline.t         t
      | Attr_str_exception : (structure_item, extension_constructor, structure) Attr_inline.t  t
      | Attr_sig_exception : (signature_item, extension_constructor, signature) Attr_inline.t  t

    type (_, _) equality = Eq : ('a, 'a) equality | Ne : (_, _) equality

    let eq : type a b. a t -> b t -> (a, b) equality = fun a b ->
      match a, b with
      | Extension          , Extension          -> Eq
      | Special_function   , Special_function   -> Eq
      | Constant           , Constant           -> Eq
      | Attr_str_type_decl , Attr_str_type_decl -> Eq
      | Attr_sig_type_decl , Attr_sig_type_decl -> Eq
      | Attr_str_type_ext  , Attr_str_type_ext  -> Eq
      | Attr_sig_type_ext  , Attr_sig_type_ext  -> Eq
      | Attr_str_exception , Attr_str_exception -> Eq
      | Attr_sig_exception , Attr_sig_exception -> Eq
      | Attr_str_module_type_decl, Attr_str_module_type_decl -> Eq
      | Attr_sig_module_type_decl, Attr_sig_module_type_decl -> Eq
      | _ -> Ne
  end

  type t = T : 'a Field.t * 'a -> t

  type ('a, 'b, 'c, 'd) attr_group_inline =
    ('b, 'c) Attr.t
    -> (ctxt:Expansion_context.Deriver.t
        -> Rec_flag.t
        -> 'b list
        -> 'c option list
        -> 'd)
    -> t

  type ('a, 'b, 'c, 'd) attr_inline =
    ('b, 'c) Attr.t
    -> (ctxt:Expansion_context.Deriver.t
        -> 'b
        -> 'c
        -> 'd)
    -> t

  let rec filter : type a. a Field.t -> t list -> a list = fun field l ->
    match l with
    | [] -> []
    | (T (field', x)) :: l ->
      match Field.eq field field' with
      | Field.Eq -> x :: filter field l
      | Field.Ne ->      filter field l
  ;;

  let extension ext = T (Extension, ext)

  let special_function id f =
    T (Special_function, { name   = id
                         ; ident  = Longid.parse id
                         ; expand = f
                         })
  ;;

  let constant kind suffix expand =
    T (Constant, { suffix; kind; expand })
  ;;

  let attr_str_type_decl attribute expand =
    T (Attr_str_type_decl, T { attribute; expand; expect = false })
  ;;

  let attr_sig_type_decl attribute expand =
    T (Attr_sig_type_decl, T { attribute; expand; expect = false })
  ;;

  let attr_str_module_type_decl attribute expand =
    T (Attr_str_module_type_decl, T { attribute; expand; expect = false })
  ;;

  let attr_sig_module_type_decl attribute expand =
    T (Attr_sig_module_type_decl, T { attribute; expand; expect = false })
  ;;

  let attr_str_type_ext attribute expand =
    T (Attr_str_type_ext, T { attribute; expand; expect = false })
  ;;

  let attr_sig_type_ext attribute expand =
    T (Attr_sig_type_ext, T { attribute; expand; expect = false })
  ;;

  let attr_str_exception attribute expand =
    T (Attr_str_exception, T { attribute; expand; expect = false })
  ;;

  let attr_sig_exception attribute expand =
    T (Attr_sig_exception, T { attribute; expand; expect = false })
  ;;

  let attr_str_type_decl_expect attribute expand =
    T (Attr_str_type_decl, T { attribute; expand; expect = true })
  ;;

  let attr_sig_type_decl_expect attribute expand =
    T (Attr_sig_type_decl, T { attribute; expand; expect = true })
  ;;

  let attr_str_module_type_decl_expect attribute expand =
    T (Attr_str_module_type_decl, T { attribute; expand; expect = true })
  ;;

  let attr_sig_module_type_decl_expect attribute expand =
    T (Attr_sig_module_type_decl, T { attribute; expand; expect = true })
  ;;

  let attr_str_type_ext_expect attribute expand =
    T (Attr_str_type_ext, T { attribute; expand; expect = true })
  ;;

  let attr_sig_type_ext_expect attribute expand =
    T (Attr_sig_type_ext, T { attribute; expand; expect = true })
  ;;

  let attr_str_exception_expect attribute expand =
    T (Attr_str_exception, T { attribute; expand; expect = true })
  ;;

  let attr_sig_exception_expect attribute expand =
    T (Attr_sig_exception, T { attribute; expand; expect = true })
  ;;
end

module Generated_code_hook = struct
  type 'a single_or_many =
    | Single of 'a
    | Many   of 'a list

  type t =
    { f : 'a. 'a Ext.Context.t -> Location.t -> 'a single_or_many -> unit }

  let nop = { f = (fun _ _ _ -> ()) }

  let replace t context loc x = t.f context loc x
  let insert_after t context (loc : Location.t) x =
    match x with
    | Many [] -> ()
    | _ -> t.f context { loc with loc_start = loc.loc_end } x
end

let rec map_node_rec context ts super_call loc base_ctxt x =
  let ctxt = Expansion_context.Extension.make ~extension_point_loc:loc ~base:base_ctxt () in
  match EC.get_extension context x with
  | None -> super_call base_ctxt x
  | Some (ext, attrs) ->
    match E.For_context.convert ts ~ctxt ext with
    | None -> super_call base_ctxt x
    | Some x ->
      map_node_rec context ts super_call loc base_ctxt (EC.merge_attributes context x attrs)
;;

let map_node context ts super_call loc base_ctxt x ~hook =
  let ctxt = Expansion_context.Extension.make ~extension_point_loc:loc ~base:base_ctxt () in
  match EC.get_extension context x with
  | None -> super_call base_ctxt x
  | Some (ext, attrs) ->
    match E.For_context.convert ts ~ctxt ext with
    | None -> super_call base_ctxt x
    | Some x ->
      let generated_code =
        map_node_rec context ts super_call loc base_ctxt (EC.merge_attributes context x attrs)
      in
      Generated_code_hook.replace hook context loc (Single generated_code);
      generated_code
;;

let rec map_nodes context ts super_call get_loc base_ctxt l ~hook ~in_generated_code =
  match l with
  | [] -> []
  | x :: l ->
    match EC.get_extension context x with
    | None ->
      (* These two lets force the evaluation order, so that errors are reported in the
         same order as they appear in the source file. *)
      let x = super_call base_ctxt x in
      let l = map_nodes context ts super_call get_loc base_ctxt l ~hook ~in_generated_code in
      x :: l
    | Some (ext, attrs) ->
      let extension_point_loc = get_loc x in
      let ctxt = Expansion_context.Extension.make ~extension_point_loc ~base:base_ctxt () in
      match E.For_context.convert_inline ts ~ctxt ext with
      | None ->
        let x = super_call base_ctxt x in
        let l =
          map_nodes context ts super_call get_loc base_ctxt l ~hook ~in_generated_code
        in
        x :: l
      | Some x ->
        assert_no_attributes attrs;
        let generated_code =
          map_nodes context ts super_call get_loc base_ctxt x ~hook
            ~in_generated_code:true
        in
        if not in_generated_code then
          Generated_code_hook.replace hook context extension_point_loc (Many generated_code);
        generated_code
        @ map_nodes context ts super_call get_loc base_ctxt l ~hook ~in_generated_code

let map_nodes = map_nodes ~in_generated_code:false

let table_of_special_functions special_functions =
  match
    List.map special_functions ~f:(fun { Rule.Special_function.ident; expand; _ } ->
      (ident, expand))
    (* We expect the lookup to fail most of the time, by making the table big (and
       sparse), we make it more likely to fail quickly *)
    |> Hashtbl.of_list ~size:(max 1024 (List.length special_functions * 2))
  with
  | `Ok table -> table
  | `Duplicate_key ident ->
    let duplicate_special_function =
      List.find_exn ~f:(fun r -> r.ident = ident) special_functions
    in
    Printf.ksprintf invalid_arg
      "Context_free.V1.map_top_down: \
       %s present twice in list of special functions"
       duplicate_special_function.name
;;

let rec get_group attr l =
  match l with
  | [] -> None
  | x :: l ->
    match Attr.get attr x, get_group attr l with
    | None       , None      -> None
    | None       , Some vals -> Some (None :: vals)
    | Some value , None      -> Some (Some value :: List.map l ~f:(fun _ -> None))
    | Some value , Some vals -> Some (Some value :: vals)
;;

(* Same as [List.rev] then [List.concat] but expecting the input to be of length <= 2 *)
let rev_concat = function
  | [] -> []
  | [x] -> x
  | [x; y] -> y @ x
  | l -> List.concat (List.rev l)
;;

let sort_attr_group_inline l =
  List.sort l ~compare:(fun a b ->
    String.compare
      (Rule.Attr_group_inline.attr_name a)
      (Rule.Attr_group_inline.attr_name b))

let sort_attr_inline l =
  List.sort l ~compare:(fun a b ->
    String.compare
      (Rule.Attr_inline.attr_name a)
      (Rule.Attr_inline.attr_name b))

(* Returns the code generated by attribute handlers. We don't remove these attributes, as
   another pass might interpret them later. For instance both ppx_deriving and
   ppx_deriving interprets [@@deriving] attributes.

   This complexity is horrible, but in practice we don't care as [attrs] is always a list
   of one element; it only has [@@deriving].
*)
let handle_attr_group_inline attrs rf items ~loc ~base_ctxt =
  List.fold_left attrs ~init:[]
    ~f:(fun acc (Rule.Attr_group_inline.T group) ->
      match get_group group.attribute items with
      | None -> acc
      | Some values ->
        let ctxt = Expansion_context.Deriver.make ~derived_item_loc:loc ~base:base_ctxt () in
        let expect_items = group.expand ~ctxt rf items values in
        expect_items :: acc)

let handle_attr_inline attrs item ~loc ~base_ctxt =
  List.fold_left attrs ~init:[]
    ~f:(fun acc (Rule.Attr_inline.T a) ->
      match Attr.get a.attribute item with
      | None -> acc
      | Some value ->
        let ctxt = Expansion_context.Deriver.make ~derived_item_loc:loc ~base:base_ctxt () in
        let expect_items = a.expand ~ctxt item value in
        expect_items :: acc)

module Expect_mismatch_handler = struct
  type t =
    { f : 'a. 'a Attr.Floating.Context.t -> Location.t -> 'a list -> unit }

  let nop = { f = fun _ _ _ -> () }
end

class map_top_down ?(expect_mismatch_handler=Expect_mismatch_handler.nop)
        ?(generated_code_hook=Generated_code_hook.nop) rules =
  let hook = generated_code_hook in

  let special_functions =
    Rule.filter Special_function rules |> table_of_special_functions
  in
  let constants =
    Rule.filter Constant rules
    |> List.map ~f:(fun (c:Rule.Constant.t) -> ((c.suffix,c.kind),c.expand))
    |> Hashtbl.of_list_exn
  in
  let extensions = Rule.filter Extension rules in
  let class_expr       = E.filter_by_context EC.class_expr       extensions
  and class_field      = E.filter_by_context EC.class_field      extensions
  and class_type       = E.filter_by_context EC.class_type       extensions
  and class_type_field = E.filter_by_context EC.class_type_field extensions
  and core_type        = E.filter_by_context EC.core_type        extensions
  and expression       = E.filter_by_context EC.expression       extensions
  and module_expr      = E.filter_by_context EC.module_expr      extensions
  and module_type      = E.filter_by_context EC.module_type      extensions
  and pattern          = E.filter_by_context EC.pattern          extensions
  and signature_item   = E.filter_by_context EC.signature_item   extensions
  and structure_item   = E.filter_by_context EC.structure_item   extensions
  in

  let attr_str_type_decls, attr_str_type_decls_expect =
    Rule.filter Attr_str_type_decl rules
    |> sort_attr_group_inline
    |> Rule.Attr_group_inline.split_normal_and_expect
  in
  let attr_sig_type_decls, attr_sig_type_decls_expect =
    Rule.filter Attr_sig_type_decl rules
    |> sort_attr_group_inline
    |> Rule.Attr_group_inline.split_normal_and_expect
  in

  let attr_str_module_type_decls, attr_str_module_type_decls_expect =
    Rule.filter Attr_str_module_type_decl rules
    |> sort_attr_inline
    |> Rule.Attr_inline.split_normal_and_expect
  in
  let attr_sig_module_type_decls, attr_sig_module_type_decls_expect =
    Rule.filter Attr_sig_module_type_decl rules
    |> sort_attr_inline
    |> Rule.Attr_inline.split_normal_and_expect
  in

  let attr_str_type_exts, attr_str_type_exts_expect =
    Rule.filter Attr_str_type_ext rules
    |> sort_attr_inline
    |> Rule.Attr_inline.split_normal_and_expect
  in
  let attr_sig_type_exts, attr_sig_type_exts_expect =
    Rule.filter Attr_sig_type_ext rules
    |> sort_attr_inline
    |> Rule.Attr_inline.split_normal_and_expect
  in

  let attr_str_exceptions, attr_str_exceptions_expect =
    Rule.filter Attr_str_exception rules
    |> sort_attr_inline
    |> Rule.Attr_inline.split_normal_and_expect
  in
  let attr_sig_exceptions, attr_sig_exceptions_expect =
    Rule.filter Attr_sig_exception rules
    |> sort_attr_inline
    |> Rule.Attr_inline.split_normal_and_expect
  in

  let map_node  = map_node  ~hook in
  let map_nodes = map_nodes ~hook in

  object(self)
    inherit Ast_traverse.map_with_expansion_context as super

    (* No point recursing into every location *)
    method! location _ x = x

    method! core_type base_ctxt x =
      map_node EC.core_type core_type super#core_type (Core_type.ptyp_loc x) base_ctxt x

    method! pattern base_ctxt x =
      map_node EC.pattern pattern super#pattern (Pattern.ppat_loc x) base_ctxt x

    method! expression base_ctxt e =
      let e =
        match%view Expression.pexp_desc e with
        | Pexp_extension _ ->
          map_node EC.expression expression (fun _ e -> e) (Expression.pexp_loc e) base_ctxt e
        | _ -> e
      in
      let expand_constant kind char text =
        match Hashtbl.find constants (char,kind) with
        | None -> super#expression base_ctxt e
        | Some expand -> self#expression base_ctxt (expand (Expression.pexp_loc e) text)
      in
      match%view Expression.pexp_desc e with
      | Pexp_apply ({ pexp_desc = Pexp_ident (Longident_loc id); _ } as func, args) -> begin
          match Hashtbl.find special_functions id.txt with
          | None ->
            self#pexp_apply_without_traversing_function base_ctxt e func args
          | Some pattern ->
            match pattern e with
            | None ->
              self#pexp_apply_without_traversing_function base_ctxt e func args
            | Some e ->
              self#expression base_ctxt e
        end
      | Pexp_ident (Longident_loc id) -> begin
          match Hashtbl.find special_functions id.txt with
          | None ->
            super#expression base_ctxt e
          | Some pattern ->
            match pattern e with
            | None ->
              super#expression base_ctxt e
            | Some e ->
              self#expression base_ctxt e
        end
      | Pexp_constant (Pconst_integer (s, Some c)) -> expand_constant Integer c s
      | Pexp_constant (Pconst_float   (s, Some c)) -> expand_constant Float   c s
      | _ ->
        super#expression base_ctxt e

    (* Pre-conditions:
       - e.pexp_desc = Pexp_apply(func, args)
       - func.pexp_desc = Pexp_ident _
    *)
    method private pexp_apply_without_traversing_function base_ctxt e func args =
      let func =
        Expression.update func
          ~pexp_attributes:(self#attributes base_ctxt (Expression.pexp_attributes func))
      in
      let args =
        List.map args ~f:(fun (lab, exp) -> (lab, self#expression base_ctxt exp))
      in
      Expression.update e
        ~pexp_attributes:(self#attributes base_ctxt (Expression.pexp_attributes e))
        ~pexp_desc:(Expression_desc.pexp_apply func args)

    method! class_type base_ctxt x =
      map_node EC.class_type class_type super#class_type (Class_type.pcty_loc x) base_ctxt x

    method! class_type_field base_ctxt x =
      map_node EC.class_type_field class_type_field super#class_type_field
        (Class_type_field.pctf_loc x) base_ctxt x

    method! class_expr base_ctxt x =
      map_node EC.class_expr class_expr super#class_expr (Class_expr.pcl_loc x) base_ctxt x

    method! class_field base_ctxt x =
      map_node EC.class_field class_field super#class_field (Class_field.pcf_loc x) base_ctxt x

    method! module_type base_ctxt x =
      map_node EC.module_type module_type super#module_type (Module_type.pmty_loc x) base_ctxt x

    method! module_expr base_ctxt x =
      map_node EC.module_expr module_expr super#module_expr (Module_expr.pmod_loc x) base_ctxt x

    method! structure_item base_ctxt x =
      map_node EC.structure_item structure_item super#structure_item (Structure_item.pstr_loc x) base_ctxt x

    method! signature_item base_ctxt x =
      map_node EC.signature_item signature_item super#signature_item (Signature_item.psig_loc x) base_ctxt x

    method! class_structure base_ctxt cstr =
      match%view cstr with
      | { pcstr_self; pcstr_fields } ->
        let pcstr_self = self#pattern base_ctxt pcstr_self in
        let pcstr_fields =
          map_nodes EC.class_field class_field super#class_field
            Class_field.pcf_loc base_ctxt pcstr_fields
        in
        Class_structure.create ~pcstr_self ~pcstr_fields

    method! class_signature base_ctxt csig =
      match%view csig with
      | { pcsig_self; pcsig_fields } ->
        let pcsig_self = self#core_type base_ctxt pcsig_self in
        let pcsig_fields =
          map_nodes EC.class_type_field class_type_field super#class_type_field
            Class_type_field.pctf_loc base_ctxt pcsig_fields
        in
        Class_signature.create ~pcsig_self ~pcsig_fields

    (* TODO: try to factorize #structure and #signature without meta-programming *)
    (*$*)
    method! structure base_ctxt st =
      let rec with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code =
        let item = super#structure_item base_ctxt item in
        let extra_items =
          loop (rev_concat (List.map extra_items ~f:Structure.to_concrete))
            ~in_generated_code:true
        in
        if not in_generated_code then
          Generated_code_hook.insert_after hook Structure_item
            (Structure_item.pstr_loc item)
            (Many extra_items);
        let original_rest = rest in
        let rest = loop rest ~in_generated_code in
        (match expect_items with
        | [] -> ()
        | _ ->
          let expected =
            Structure.create (rev_concat (List.map expect_items ~f:Structure.to_concrete))
          in
          let pos = (Structure_item.pstr_loc item).loc_end in
          Code_matcher.match_structure (Structure.create original_rest) ~pos ~expected
            ~mismatch_handler:(fun loc repl ->
              expect_mismatch_handler.f Structure_item loc (Structure.to_concrete repl)));
        item :: (extra_items @ rest)
      and loop st ~in_generated_code =
        match st with
        | [] -> []
        | item :: rest ->
          let loc = Structure_item.pstr_loc item in
          match%view Structure_item.pstr_desc item with
          | Pstr_extension (ext, attrs) -> begin
              let extension_point_loc = Structure_item.pstr_loc item in
              let ctxt = Expansion_context.Extension.make ~extension_point_loc ~base:base_ctxt () in
              match E.For_context.convert_inline structure_item ~ctxt ext with
              | None ->
                let item = super#structure_item base_ctxt item in
                let rest = self#structure base_ctxt (Structure.create rest) in
                item :: Structure.to_concrete rest
              | Some items ->
                assert_no_attributes attrs;
                let items = loop items ~in_generated_code:true in
                if not in_generated_code then
                  Generated_code_hook.replace hook Structure_item
                    (Structure_item.pstr_loc item)
                    (Many items);
                items @ loop rest ~in_generated_code
            end

          | Pstr_type(rf, tds) ->
            let extra_items =
              handle_attr_group_inline attr_str_type_decls rf tds ~loc ~base_ctxt
            in
            let expect_items =
              handle_attr_group_inline attr_str_type_decls_expect rf tds ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | Pstr_modtype mtd ->
            let extra_items =
              handle_attr_inline attr_str_module_type_decls mtd ~loc ~base_ctxt
            in
            let expect_items =
              handle_attr_inline attr_str_module_type_decls_expect mtd ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | Pstr_typext te ->
            let extra_items = handle_attr_inline attr_str_type_exts te ~loc ~base_ctxt in
            let expect_items =
              handle_attr_inline attr_str_type_exts_expect te ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | Pstr_exception ec ->
            let extra_items = handle_attr_inline attr_str_exceptions ec ~loc ~base_ctxt in
            let expect_items =
              handle_attr_inline attr_str_exceptions_expect ec ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | _ ->
            let item = self#structure_item base_ctxt item in
            let rest = self#structure base_ctxt (Structure.create rest) in
            item :: Structure.to_concrete rest
      in
      Structure.create (loop (Structure.to_concrete st) ~in_generated_code:false)

    (*$ str_to_sig _last_text_block *)
    method! signature base_ctxt sg =
      let rec with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code =
        let item = super#signature_item base_ctxt item in
        let extra_items =
          loop (rev_concat (List.map extra_items ~f:Signature.to_concrete))
            ~in_generated_code:true
        in
        if not in_generated_code then
          Generated_code_hook.insert_after hook Signature_item
            (Signature_item.psig_loc item)
            (Many extra_items);
        let original_rest = rest in
        let rest = loop rest ~in_generated_code in
        (match expect_items with
        | [] -> ()
        | _ ->
          let expected =
            Signature.create (rev_concat (List.map expect_items ~f:Signature.to_concrete))
          in
          let pos = (Signature_item.psig_loc item).loc_end in
          Code_matcher.match_signature (Signature.create original_rest) ~pos ~expected
            ~mismatch_handler:(fun loc repl ->
              expect_mismatch_handler.f Signature_item loc (Signature.to_concrete repl)));
        item :: (extra_items @ rest)
      and loop sg ~in_generated_code =
        match sg with
        | [] -> []
        | item :: rest ->
          let loc = Signature_item.psig_loc item in
          match%view Signature_item.psig_desc item with
          | Psig_extension (ext, attrs) -> begin
              let extension_point_loc = Signature_item.psig_loc item in
              let ctxt = Expansion_context.Extension.make ~extension_point_loc ~base:base_ctxt () in
              match E.For_context.convert_inline signature_item ~ctxt ext with
              | None ->
                let item = super#signature_item base_ctxt item in
                let rest = self#signature base_ctxt (Signature.create rest) in
                item :: Signature.to_concrete rest
              | Some items ->
                assert_no_attributes attrs;
                let items = loop items ~in_generated_code:true in
                if not in_generated_code then
                  Generated_code_hook.replace hook Signature_item
                    (Signature_item.psig_loc item)
                    (Many items);
                items @ loop rest ~in_generated_code
            end

          | Psig_type(rf, tds) ->
            let extra_items =
              handle_attr_group_inline attr_sig_type_decls rf tds ~loc ~base_ctxt
            in
            let expect_items =
              handle_attr_group_inline attr_sig_type_decls_expect rf tds ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | Psig_modtype mtd ->
            let extra_items =
              handle_attr_inline attr_sig_module_type_decls mtd ~loc ~base_ctxt
            in
            let expect_items =
              handle_attr_inline attr_sig_module_type_decls_expect mtd ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | Psig_typext te ->
            let extra_items = handle_attr_inline attr_sig_type_exts te ~loc ~base_ctxt in
            let expect_items =
              handle_attr_inline attr_sig_type_exts_expect te ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | Psig_exception ec ->
            let extra_items = handle_attr_inline attr_sig_exceptions ec ~loc ~base_ctxt in
            let expect_items =
              handle_attr_inline attr_sig_exceptions_expect ec ~loc ~base_ctxt
            in
            with_extra_items item ~extra_items ~expect_items ~rest ~in_generated_code

          | _ ->
            let item = self#signature_item base_ctxt item in
            let rest = self#signature base_ctxt (Signature.create rest) in
            item :: Signature.to_concrete rest
      in
      Signature.create (loop (Signature.to_concrete sg) ~in_generated_code:false)

    (*$*)
  end
