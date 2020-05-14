open Viewlib

(*$ Ppx_ast_cinaps.print_viewer_mli (Astlib.Version.of_string "unstable_for_testing") *)
open Versions
open Unstable_for_testing
include module type of Viewer_common

val pdir_bool'const : (bool, 'i, 'o) View.t -> (Directive_argument.t, 'i, 'o) View.t

val pdir_ident'const : (Longident.t, 'i, 'o) View.t -> (Directive_argument.t, 'i, 'o) View.t

val pdir_int'const : ((char option * string), 'i, 'o) View.t -> (Directive_argument.t, 'i, 'o) View.t

val pdir_string'const : (string, 'i, 'o) View.t -> (Directive_argument.t, 'i, 'o) View.t

val pdir_none'const : (Directive_argument.t, 'a, 'a) View.t

val ptop_dir'const : ((Directive_argument.t * string), 'i, 'o) View.t -> (Toplevel_phrase.t, 'i, 'o) View.t

val ptop_def'const : (Structure.t, 'i, 'o) View.t -> (Toplevel_phrase.t, 'i, 'o) View.t

val pmb_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Module_binding.t, 'i, 'o) View.t

val pmb_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Module_binding.t, 'i, 'o) View.t

val pmb_expr'match : (Module_expr.t, 'i, 'o) View.t -> (Module_binding.t, 'i, 'o) View.t

val pmb_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Module_binding.t, 'i, 'o) View.t

val pvb_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Value_binding.t, 'i, 'o) View.t

val pvb_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Value_binding.t, 'i, 'o) View.t

val pvb_expr'match : (Expression.t, 'i, 'o) View.t -> (Value_binding.t, 'i, 'o) View.t

val pvb_pat'match : (Pattern.t, 'i, 'o) View.t -> (Value_binding.t, 'i, 'o) View.t

val pstr_extension'const : ((Attributes.t * Extension.t), 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strextension'const : ((Attributes.t * Extension.t), 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_attribute'const : (Attribute.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strattribute'const : (Attribute.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_include'const : (Include_declaration.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strinclude'const : (Include_declaration.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_class_type'const : (Class_type_declaration.t list, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strclass_type'const : (Class_type_declaration.t list, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_class'const : (Class_declaration.t list, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strclass'const : (Class_declaration.t list, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_open'const : (Open_description.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val stropen'const : (Open_description.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_modtype'const : (Module_type_declaration.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strmodtype'const : (Module_type_declaration.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_recmodule'const : (Module_binding.t list, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strrecmodule'const : (Module_binding.t list, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_module'const : (Module_binding.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strmodule'const : (Module_binding.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_exception'const : (Extension_constructor.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strexception'const : (Extension_constructor.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_typext'const : (Type_extension.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strtypext'const : (Type_extension.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_type'const : ((Type_declaration.t list * Rec_flag.t), 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strtype'const : ((Type_declaration.t list * Rec_flag.t), 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_primitive'const : (Value_description.t, 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strprimitive'const : (Value_description.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_value'const : ((Value_binding.t list * Rec_flag.t), 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val strvalue'const : ((Value_binding.t list * Rec_flag.t), 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_eval'const : ((Attributes.t * Expression.t), 'i, 'o) View.t -> (Structure_item_desc.t, 'i, 'o) View.t

val streval'const : ((Attributes.t * Expression.t), 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t

val pstr_desc'match : (Structure_item_desc.t, 'i, 'o) View.t -> (Structure_item.t, 'i, 'o) View.t
val structure'const: (Structure_item.t list, 'i, 'o) View.t -> (Structure.t, 'i, 'o) View.t

val pmod_extension'const : (Extension.t, 'i, 'o) View.t -> (Module_expr_desc.t, 'i, 'o) View.t

val meextension'const : (Extension.t, 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_unpack'const : (Expression.t, 'i, 'o) View.t -> (Module_expr_desc.t, 'i, 'o) View.t

val meunpack'const : (Expression.t, 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_constraint'const : ((Module_type.t * Module_expr.t), 'i, 'o) View.t -> (Module_expr_desc.t, 'i, 'o) View.t

val meconstraint'const : ((Module_type.t * Module_expr.t), 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_apply'const : ((Module_expr.t * Module_expr.t), 'i, 'o) View.t -> (Module_expr_desc.t, 'i, 'o) View.t

val meapply'const : ((Module_expr.t * Module_expr.t), 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_functor'const : ((Module_expr.t * Module_type.t option * string Astlib.Loc.t), 'i, 'o) View.t -> (Module_expr_desc.t, 'i, 'o) View.t

val mefunctor'const : ((Module_expr.t * Module_type.t option * string Astlib.Loc.t), 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_structure'const : (Structure.t, 'i, 'o) View.t -> (Module_expr_desc.t, 'i, 'o) View.t

val mestructure'const : (Structure.t, 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_ident'const : (Longident_loc.t, 'i, 'o) View.t -> (Module_expr_desc.t, 'i, 'o) View.t

val meident'const : (Longident_loc.t, 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pmod_desc'match : (Module_expr_desc.t, 'i, 'o) View.t -> (Module_expr.t, 'i, 'o) View.t

val pwith_modsubst'const : ((Longident_loc.t * Longident_loc.t), 'i, 'o) View.t -> (With_constraint.t, 'i, 'o) View.t

val pwith_typesubst'const : ((Type_declaration.t * Longident_loc.t), 'i, 'o) View.t -> (With_constraint.t, 'i, 'o) View.t

val pwith_module'const : ((Longident_loc.t * Longident_loc.t), 'i, 'o) View.t -> (With_constraint.t, 'i, 'o) View.t

val pwith_type'const : ((Type_declaration.t * Longident_loc.t), 'i, 'o) View.t -> (With_constraint.t, 'i, 'o) View.t
val include_declaration'const: (Module_expr.t Include_infos.t, 'i, 'o) View.t -> (Include_declaration.t, 'i, 'o) View.t
val include_description'const: (Module_type.t Include_infos.t, 'i, 'o) View.t -> (Include_description.t, 'i, 'o) View.t

val pincl_attributes'match : (Attributes.t, 'i, 'o) View.t -> ('a node Include_infos.t, 'i, 'o) View.t

val pincl_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> ('a node Include_infos.t, 'i, 'o) View.t

val pincl_mod'match : ('a node, 'i, 'o) View.t -> ('a node Include_infos.t, 'i, 'o) View.t

val popen_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Open_description.t, 'i, 'o) View.t

val popen_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Open_description.t, 'i, 'o) View.t

val popen_override'match : (Override_flag.t, 'i, 'o) View.t -> (Open_description.t, 'i, 'o) View.t

val popen_lid'match : (Longident_loc.t, 'i, 'o) View.t -> (Open_description.t, 'i, 'o) View.t

val pmtd_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Module_type_declaration.t, 'i, 'o) View.t

val pmtd_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Module_type_declaration.t, 'i, 'o) View.t

val pmtd_type'match : (Module_type.t option, 'i, 'o) View.t -> (Module_type_declaration.t, 'i, 'o) View.t

val pmtd_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Module_type_declaration.t, 'i, 'o) View.t

val pmd_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Module_declaration.t, 'i, 'o) View.t

val pmd_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Module_declaration.t, 'i, 'o) View.t

val pmd_type'match : (Module_type.t, 'i, 'o) View.t -> (Module_declaration.t, 'i, 'o) View.t

val pmd_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Module_declaration.t, 'i, 'o) View.t

val psig_extension'const : ((Attributes.t * Extension.t), 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigextension'const : ((Attributes.t * Extension.t), 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_attribute'const : (Attribute.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigattribute'const : (Attribute.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_class_type'const : (Class_type_declaration.t list, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigclass_type'const : (Class_type_declaration.t list, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_class'const : (Class_description.t list, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigclass'const : (Class_description.t list, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_include'const : (Include_description.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val siginclude'const : (Include_description.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_open'const : (Open_description.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigopen'const : (Open_description.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_modtype'const : (Module_type_declaration.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigmodtype'const : (Module_type_declaration.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_recmodule'const : (Module_declaration.t list, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigrecmodule'const : (Module_declaration.t list, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_module'const : (Module_declaration.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigmodule'const : (Module_declaration.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_exception'const : (Extension_constructor.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigexception'const : (Extension_constructor.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_typext'const : (Type_extension.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigtypext'const : (Type_extension.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_type'const : ((Type_declaration.t list * Rec_flag.t), 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigtype'const : ((Type_declaration.t list * Rec_flag.t), 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_value'const : (Value_description.t, 'i, 'o) View.t -> (Signature_item_desc.t, 'i, 'o) View.t

val sigvalue'const : (Value_description.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t

val psig_desc'match : (Signature_item_desc.t, 'i, 'o) View.t -> (Signature_item.t, 'i, 'o) View.t
val signature'const: (Signature_item.t list, 'i, 'o) View.t -> (Signature.t, 'i, 'o) View.t

val pmty_alias'const : (Longident_loc.t, 'i, 'o) View.t -> (Module_type_desc.t, 'i, 'o) View.t

val mtalias'const : (Longident_loc.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_extension'const : (Extension.t, 'i, 'o) View.t -> (Module_type_desc.t, 'i, 'o) View.t

val mtextension'const : (Extension.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_typeof'const : (Module_expr.t, 'i, 'o) View.t -> (Module_type_desc.t, 'i, 'o) View.t

val mttypeof'const : (Module_expr.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_with'const : ((With_constraint.t list * Module_type.t), 'i, 'o) View.t -> (Module_type_desc.t, 'i, 'o) View.t

val mtwith'const : ((With_constraint.t list * Module_type.t), 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_functor'const : ((Module_type.t * Module_type.t option * string Astlib.Loc.t), 'i, 'o) View.t -> (Module_type_desc.t, 'i, 'o) View.t

val mtfunctor'const : ((Module_type.t * Module_type.t option * string Astlib.Loc.t), 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_signature'const : (Signature.t, 'i, 'o) View.t -> (Module_type_desc.t, 'i, 'o) View.t

val mtsignature'const : (Signature.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_ident'const : (Longident_loc.t, 'i, 'o) View.t -> (Module_type_desc.t, 'i, 'o) View.t

val mtident'const : (Longident_loc.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t

val pmty_desc'match : (Module_type_desc.t, 'i, 'o) View.t -> (Module_type.t, 'i, 'o) View.t
val class_declaration'const: (Class_expr.t Class_infos.t, 'i, 'o) View.t -> (Class_declaration.t, 'i, 'o) View.t

val cfk_concrete'const : ((Expression.t * Override_flag.t), 'i, 'o) View.t -> (Class_field_kind.t, 'i, 'o) View.t

val cfk_virtual'const : (Core_type.t, 'i, 'o) View.t -> (Class_field_kind.t, 'i, 'o) View.t

val pcf_extension'const : (Extension.t, 'i, 'o) View.t -> (Class_field_desc.t, 'i, 'o) View.t

val cfextension'const : (Extension.t, 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_attribute'const : (Attribute.t, 'i, 'o) View.t -> (Class_field_desc.t, 'i, 'o) View.t

val cfattribute'const : (Attribute.t, 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_initializer'const : (Expression.t, 'i, 'o) View.t -> (Class_field_desc.t, 'i, 'o) View.t

val cfinitializer'const : (Expression.t, 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_constraint'const : ((Core_type.t * Core_type.t), 'i, 'o) View.t -> (Class_field_desc.t, 'i, 'o) View.t

val cfconstraint'const : ((Core_type.t * Core_type.t), 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_method'const : ((Class_field_kind.t * Private_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_field_desc.t, 'i, 'o) View.t

val cfmethod'const : ((Class_field_kind.t * Private_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_val'const : ((Class_field_kind.t * Mutable_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_field_desc.t, 'i, 'o) View.t

val cfval'const : ((Class_field_kind.t * Mutable_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_inherit'const : ((string Astlib.Loc.t option * Class_expr.t * Override_flag.t), 'i, 'o) View.t -> (Class_field_desc.t, 'i, 'o) View.t

val cfinherit'const : ((string Astlib.Loc.t option * Class_expr.t * Override_flag.t), 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcf_desc'match : (Class_field_desc.t, 'i, 'o) View.t -> (Class_field.t, 'i, 'o) View.t

val pcstr_fields'match : (Class_field.t list, 'i, 'o) View.t -> (Class_structure.t, 'i, 'o) View.t

val pcstr_self'match : (Pattern.t, 'i, 'o) View.t -> (Class_structure.t, 'i, 'o) View.t

val pcl_open'const : ((Class_expr.t * Longident_loc.t * Override_flag.t), 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val ceopen'const : ((Class_expr.t * Longident_loc.t * Override_flag.t), 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_extension'const : (Extension.t, 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val ceextension'const : (Extension.t, 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_constraint'const : ((Class_type.t * Class_expr.t), 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val ceconstraint'const : ((Class_type.t * Class_expr.t), 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_let'const : ((Class_expr.t * Value_binding.t list * Rec_flag.t), 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val celet'const : ((Class_expr.t * Value_binding.t list * Rec_flag.t), 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_apply'const : (((Expression.t * Arg_label.t) list * Class_expr.t), 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val ceapply'const : (((Expression.t * Arg_label.t) list * Class_expr.t), 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_fun'const : ((Class_expr.t * Pattern.t * Expression.t option * Arg_label.t), 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val cefun'const : ((Class_expr.t * Pattern.t * Expression.t option * Arg_label.t), 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_structure'const : (Class_structure.t, 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val cestructure'const : (Class_structure.t, 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_constr'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Class_expr_desc.t, 'i, 'o) View.t

val ceconstr'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t

val pcl_desc'match : (Class_expr_desc.t, 'i, 'o) View.t -> (Class_expr.t, 'i, 'o) View.t
val class_type_declaration'const: (Class_type.t Class_infos.t, 'i, 'o) View.t -> (Class_type_declaration.t, 'i, 'o) View.t
val class_description'const: (Class_type.t Class_infos.t, 'i, 'o) View.t -> (Class_description.t, 'i, 'o) View.t

val pci_attributes'match : (Attributes.t, 'i, 'o) View.t -> ('a node Class_infos.t, 'i, 'o) View.t

val pci_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> ('a node Class_infos.t, 'i, 'o) View.t

val pci_expr'match : ('a node, 'i, 'o) View.t -> ('a node Class_infos.t, 'i, 'o) View.t

val pci_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> ('a node Class_infos.t, 'i, 'o) View.t

val pci_params'match : ((Variance.t * Core_type.t) list, 'i, 'o) View.t -> ('a node Class_infos.t, 'i, 'o) View.t

val pci_virt'match : (Virtual_flag.t, 'i, 'o) View.t -> ('a node Class_infos.t, 'i, 'o) View.t

val pctf_extension'const : (Extension.t, 'i, 'o) View.t -> (Class_type_field_desc.t, 'i, 'o) View.t

val ctfextension'const : (Extension.t, 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_attribute'const : (Attribute.t, 'i, 'o) View.t -> (Class_type_field_desc.t, 'i, 'o) View.t

val ctfattribute'const : (Attribute.t, 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_constraint'const : ((Core_type.t * Core_type.t), 'i, 'o) View.t -> (Class_type_field_desc.t, 'i, 'o) View.t

val ctfconstraint'const : ((Core_type.t * Core_type.t), 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_method'const : ((Core_type.t * Virtual_flag.t * Private_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_type_field_desc.t, 'i, 'o) View.t

val ctfmethod'const : ((Core_type.t * Virtual_flag.t * Private_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_val'const : ((Core_type.t * Virtual_flag.t * Mutable_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_type_field_desc.t, 'i, 'o) View.t

val ctfval'const : ((Core_type.t * Virtual_flag.t * Mutable_flag.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_inherit'const : (Class_type.t, 'i, 'o) View.t -> (Class_type_field_desc.t, 'i, 'o) View.t

val ctfinherit'const : (Class_type.t, 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pctf_desc'match : (Class_type_field_desc.t, 'i, 'o) View.t -> (Class_type_field.t, 'i, 'o) View.t

val pcsig_fields'match : (Class_type_field.t list, 'i, 'o) View.t -> (Class_signature.t, 'i, 'o) View.t

val pcsig_self'match : (Core_type.t, 'i, 'o) View.t -> (Class_signature.t, 'i, 'o) View.t

val pcty_open'const : ((Class_type.t * Longident_loc.t * Override_flag.t), 'i, 'o) View.t -> (Class_type_desc.t, 'i, 'o) View.t

val ctopen'const : ((Class_type.t * Longident_loc.t * Override_flag.t), 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pcty_extension'const : (Extension.t, 'i, 'o) View.t -> (Class_type_desc.t, 'i, 'o) View.t

val ctextension'const : (Extension.t, 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pcty_arrow'const : ((Class_type.t * Core_type.t * Arg_label.t), 'i, 'o) View.t -> (Class_type_desc.t, 'i, 'o) View.t

val ctarrow'const : ((Class_type.t * Core_type.t * Arg_label.t), 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pcty_signature'const : (Class_signature.t, 'i, 'o) View.t -> (Class_type_desc.t, 'i, 'o) View.t

val ctsignature'const : (Class_signature.t, 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pcty_constr'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Class_type_desc.t, 'i, 'o) View.t

val ctconstr'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pcty_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pcty_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pcty_desc'match : (Class_type_desc.t, 'i, 'o) View.t -> (Class_type.t, 'i, 'o) View.t

val pext_rebind'const : (Longident_loc.t, 'i, 'o) View.t -> (Extension_constructor_kind.t, 'i, 'o) View.t

val pext_decl'const : ((Core_type.t option * Constructor_arguments.t), 'i, 'o) View.t -> (Extension_constructor_kind.t, 'i, 'o) View.t

val pext_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Extension_constructor.t, 'i, 'o) View.t

val pext_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Extension_constructor.t, 'i, 'o) View.t

val pext_kind'match : (Extension_constructor_kind.t, 'i, 'o) View.t -> (Extension_constructor.t, 'i, 'o) View.t

val pext_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Extension_constructor.t, 'i, 'o) View.t

val ptyext_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Type_extension.t, 'i, 'o) View.t

val ptyext_private'match : (Private_flag.t, 'i, 'o) View.t -> (Type_extension.t, 'i, 'o) View.t

val ptyext_constructors'match : (Extension_constructor.t list, 'i, 'o) View.t -> (Type_extension.t, 'i, 'o) View.t

val ptyext_params'match : ((Variance.t * Core_type.t) list, 'i, 'o) View.t -> (Type_extension.t, 'i, 'o) View.t

val ptyext_path'match : (Longident_loc.t, 'i, 'o) View.t -> (Type_extension.t, 'i, 'o) View.t

val pcstr_record'const : (Label_declaration.t list, 'i, 'o) View.t -> (Constructor_arguments.t, 'i, 'o) View.t

val pcstr_tuple'const : (Core_type.t list, 'i, 'o) View.t -> (Constructor_arguments.t, 'i, 'o) View.t

val pcd_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Constructor_declaration.t, 'i, 'o) View.t

val pcd_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Constructor_declaration.t, 'i, 'o) View.t

val pcd_res'match : (Core_type.t option, 'i, 'o) View.t -> (Constructor_declaration.t, 'i, 'o) View.t

val pcd_args'match : (Constructor_arguments.t, 'i, 'o) View.t -> (Constructor_declaration.t, 'i, 'o) View.t

val pcd_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Constructor_declaration.t, 'i, 'o) View.t

val pld_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Label_declaration.t, 'i, 'o) View.t

val pld_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Label_declaration.t, 'i, 'o) View.t

val pld_type'match : (Core_type.t, 'i, 'o) View.t -> (Label_declaration.t, 'i, 'o) View.t

val pld_mutable'match : (Mutable_flag.t, 'i, 'o) View.t -> (Label_declaration.t, 'i, 'o) View.t

val pld_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Label_declaration.t, 'i, 'o) View.t

val ptype_open'const : (Type_kind.t, 'a, 'a) View.t

val ptype_record'const : (Label_declaration.t list, 'i, 'o) View.t -> (Type_kind.t, 'i, 'o) View.t

val ptype_variant'const : (Constructor_declaration.t list, 'i, 'o) View.t -> (Type_kind.t, 'i, 'o) View.t

val ptype_abstract'const : (Type_kind.t, 'a, 'a) View.t

val ptype_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val ptype_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val ptype_manifest'match : (Core_type.t option, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val ptype_private'match : (Private_flag.t, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val ptype_kind'match : (Type_kind.t, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val ptype_cstrs'match : ((Astlib.Location.t * Core_type.t * Core_type.t) list, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val ptype_params'match : ((Variance.t * Core_type.t) list, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val ptype_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Type_declaration.t, 'i, 'o) View.t

val pval_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Value_description.t, 'i, 'o) View.t

val pval_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Value_description.t, 'i, 'o) View.t

val pval_prim'match : (string list, 'i, 'o) View.t -> (Value_description.t, 'i, 'o) View.t

val pval_type'match : (Core_type.t, 'i, 'o) View.t -> (Value_description.t, 'i, 'o) View.t

val pval_name'match : (string Astlib.Loc.t, 'i, 'o) View.t -> (Value_description.t, 'i, 'o) View.t

val pc_rhs'match : (Expression.t, 'i, 'o) View.t -> (Case.t, 'i, 'o) View.t

val pc_guard'match : (Expression.t option, 'i, 'o) View.t -> (Case.t, 'i, 'o) View.t

val pc_lhs'match : (Pattern.t, 'i, 'o) View.t -> (Case.t, 'i, 'o) View.t

val pexp_unreachable'const : (Expression_desc.t, 'a, 'a) View.t

val eunreachable'const : (Expression.t, 'a, 'a) View.t

val pexp_extension'const : (Extension.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eextension'const : (Extension.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_open'const : ((Expression.t * Longident_loc.t * Override_flag.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eopen'const : ((Expression.t * Longident_loc.t * Override_flag.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_pack'const : (Module_expr.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val epack'const : (Module_expr.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_newtype'const : ((Expression.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val enewtype'const : ((Expression.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_object'const : (Class_structure.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eobject'const : (Class_structure.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_poly'const : ((Core_type.t option * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val epoly'const : ((Core_type.t option * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_lazy'const : (Expression.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val elazy'const : (Expression.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_assert'const : (Expression.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eassert'const : (Expression.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_letexception'const : ((Expression.t * Extension_constructor.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eletexception'const : ((Expression.t * Extension_constructor.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_letmodule'const : ((Expression.t * Module_expr.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eletmodule'const : ((Expression.t * Module_expr.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_override'const : ((Expression.t * string Astlib.Loc.t) list, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eoverride'const : ((Expression.t * string Astlib.Loc.t) list, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_setinstvar'const : ((Expression.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val esetinstvar'const : ((Expression.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_new'const : (Longident_loc.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val enew'const : (Longident_loc.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_send'const : ((string Astlib.Loc.t * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val esend'const : ((string Astlib.Loc.t * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_coerce'const : ((Core_type.t * Core_type.t option * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val ecoerce'const : ((Core_type.t * Core_type.t option * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_constraint'const : ((Core_type.t * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val econstraint'const : ((Core_type.t * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_for'const : ((Expression.t * Direction_flag.t * Expression.t * Expression.t * Pattern.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val efor'const : ((Expression.t * Direction_flag.t * Expression.t * Expression.t * Pattern.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_while'const : ((Expression.t * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val ewhile'const : ((Expression.t * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_sequence'const : ((Expression.t * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val esequence'const : ((Expression.t * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_ifthenelse'const : ((Expression.t option * Expression.t * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eifthenelse'const : ((Expression.t option * Expression.t * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_array'const : (Expression.t list, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val earray'const : (Expression.t list, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_setfield'const : ((Expression.t * Longident_loc.t * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val esetfield'const : ((Expression.t * Longident_loc.t * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_field'const : ((Longident_loc.t * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val efield'const : ((Longident_loc.t * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_record'const : ((Expression.t option * (Expression.t * Longident_loc.t) list), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val erecord'const : ((Expression.t option * (Expression.t * Longident_loc.t) list), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_variant'const : ((Expression.t option * string), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val evariant'const : ((Expression.t option * string), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_construct'const : ((Expression.t option * Longident_loc.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val econstruct'const : ((Expression.t option * Longident_loc.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_tuple'const : (Expression.t list, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val etuple'const : (Expression.t list, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_try'const : ((Case.t list * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val etry'const : ((Case.t list * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_match'const : ((Case.t list * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val ematch'const : ((Case.t list * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_apply'const : (((Expression.t * Arg_label.t) list * Expression.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eapply'const : (((Expression.t * Arg_label.t) list * Expression.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_fun'const : ((Expression.t * Pattern.t * Expression.t option * Arg_label.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val efun'const : ((Expression.t * Pattern.t * Expression.t option * Arg_label.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_function'const : (Case.t list, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val efunction'const : (Case.t list, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_let'const : ((Expression.t * Value_binding.t list * Rec_flag.t), 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val elet'const : ((Expression.t * Value_binding.t list * Rec_flag.t), 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_constant'const : (Constant.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val econstant'const : (Constant.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_ident'const : (Longident_loc.t, 'i, 'o) View.t -> (Expression_desc.t, 'i, 'o) View.t

val eident'const : (Longident_loc.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val pexp_desc'match : (Expression_desc.t, 'i, 'o) View.t -> (Expression.t, 'i, 'o) View.t

val ppat_open'const : ((Pattern.t * Longident_loc.t), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val popen'const : ((Pattern.t * Longident_loc.t), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_extension'const : (Extension.t, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pextension'const : (Extension.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_exception'const : (Pattern.t, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pexception'const : (Pattern.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_unpack'const : (string Astlib.Loc.t, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val punpack'const : (string Astlib.Loc.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_lazy'const : (Pattern.t, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val plazy'const : (Pattern.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_type'const : (Longident_loc.t, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val ptype'const : (Longident_loc.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_constraint'const : ((Core_type.t * Pattern.t), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pconstraint'const : ((Core_type.t * Pattern.t), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_or'const : ((Pattern.t * Pattern.t), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val por'const : ((Pattern.t * Pattern.t), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_array'const : (Pattern.t list, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val parray'const : (Pattern.t list, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_record'const : ((Closed_flag.t * (Pattern.t * Longident_loc.t) list), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val precord'const : ((Closed_flag.t * (Pattern.t * Longident_loc.t) list), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_variant'const : ((Pattern.t option * string), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pvariant'const : ((Pattern.t option * string), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_construct'const : ((Pattern.t option * Longident_loc.t), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pconstruct'const : ((Pattern.t option * Longident_loc.t), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_tuple'const : (Pattern.t list, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val ptuple'const : (Pattern.t list, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_interval'const : ((Constant.t * Constant.t), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pinterval'const : ((Constant.t * Constant.t), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_constant'const : (Constant.t, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pconstant'const : (Constant.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_alias'const : ((string Astlib.Loc.t * Pattern.t), 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val palias'const : ((string Astlib.Loc.t * Pattern.t), 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_var'const : (string Astlib.Loc.t, 'i, 'o) View.t -> (Pattern_desc.t, 'i, 'o) View.t

val pvar'const : (string Astlib.Loc.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_any'const : (Pattern_desc.t, 'a, 'a) View.t

val pany'const : (Pattern.t, 'a, 'a) View.t

val ppat_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val ppat_desc'match : (Pattern_desc.t, 'i, 'o) View.t -> (Pattern.t, 'i, 'o) View.t

val oinherit'const : (Core_type.t, 'i, 'o) View.t -> (Object_field.t, 'i, 'o) View.t

val otag'const : ((Core_type.t * Attributes.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Object_field.t, 'i, 'o) View.t

val rinherit'const : (Core_type.t, 'i, 'o) View.t -> (Row_field.t, 'i, 'o) View.t

val rtag'const : ((Core_type.t list * bool * Attributes.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Row_field.t, 'i, 'o) View.t
val package_type'const: (((Core_type.t * Longident_loc.t) list * Longident_loc.t), 'i, 'o) View.t -> (Package_type.t, 'i, 'o) View.t

val ptyp_extension'const : (Extension.t, 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val textension'const : (Extension.t, 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_package'const : (Package_type.t, 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tpackage'const : (Package_type.t, 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_poly'const : ((Core_type.t * string Astlib.Loc.t list), 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tpoly'const : ((Core_type.t * string Astlib.Loc.t list), 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_variant'const : ((string list option * Closed_flag.t * Row_field.t list), 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tvariant'const : ((string list option * Closed_flag.t * Row_field.t list), 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_alias'const : ((string * Core_type.t), 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val talias'const : ((string * Core_type.t), 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_class'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tclass'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_object'const : ((Closed_flag.t * Object_field.t list), 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tobject'const : ((Closed_flag.t * Object_field.t list), 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_constr'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tconstr'const : ((Core_type.t list * Longident_loc.t), 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_tuple'const : (Core_type.t list, 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val ttuple'const : (Core_type.t list, 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_arrow'const : ((Core_type.t * Core_type.t * Arg_label.t), 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tarrow'const : ((Core_type.t * Core_type.t * Arg_label.t), 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_var'const : (string, 'i, 'o) View.t -> (Core_type_desc.t, 'i, 'o) View.t

val tvar'const : (string, 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_any'const : (Core_type_desc.t, 'a, 'a) View.t

val tany'const : (Core_type.t, 'a, 'a) View.t

val ptyp_attributes'match : (Attributes.t, 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_loc'match : (Astlib.Location.t, 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val ptyp_desc'match : (Core_type_desc.t, 'i, 'o) View.t -> (Core_type.t, 'i, 'o) View.t

val pPat'const : ((Expression.t option * Pattern.t), 'i, 'o) View.t -> (Payload.t, 'i, 'o) View.t

val pTyp'const : (Core_type.t, 'i, 'o) View.t -> (Payload.t, 'i, 'o) View.t

val pSig'const : (Signature.t, 'i, 'o) View.t -> (Payload.t, 'i, 'o) View.t

val pStr'const : (Structure.t, 'i, 'o) View.t -> (Payload.t, 'i, 'o) View.t
val attributes'const: (Attribute.t list, 'i, 'o) View.t -> (Attributes.t, 'i, 'o) View.t
val extension'const: ((Payload.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Extension.t, 'i, 'o) View.t
val attribute'const: ((Payload.t * string Astlib.Loc.t), 'i, 'o) View.t -> (Attribute.t, 'i, 'o) View.t

val pconst_float'const : ((char option * string), 'i, 'o) View.t -> (Constant.t, 'i, 'o) View.t

val pconst_string'const : ((string option * string), 'i, 'o) View.t -> (Constant.t, 'i, 'o) View.t

val pconst_char'const : (char, 'i, 'o) View.t -> (Constant.t, 'i, 'o) View.t

val pconst_integer'const : ((char option * string), 'i, 'o) View.t -> (Constant.t, 'i, 'o) View.t

val invariant'const : (Variance.t, 'a, 'a) View.t

val contravariant'const : (Variance.t, 'a, 'a) View.t

val covariant'const : (Variance.t, 'a, 'a) View.t

val optional'const : (string, 'i, 'o) View.t -> (Arg_label.t, 'i, 'o) View.t

val labelled'const : (string, 'i, 'o) View.t -> (Arg_label.t, 'i, 'o) View.t

val nolabel'const : (Arg_label.t, 'a, 'a) View.t

val open'const : (Closed_flag.t, 'a, 'a) View.t

val closed'const : (Closed_flag.t, 'a, 'a) View.t

val fresh'const : (Override_flag.t, 'a, 'a) View.t

val override'const : (Override_flag.t, 'a, 'a) View.t

val concrete'const : (Virtual_flag.t, 'a, 'a) View.t

val virtual'const : (Virtual_flag.t, 'a, 'a) View.t

val mutable'const : (Mutable_flag.t, 'a, 'a) View.t

val immutable'const : (Mutable_flag.t, 'a, 'a) View.t

val public'const : (Private_flag.t, 'a, 'a) View.t

val private'const : (Private_flag.t, 'a, 'a) View.t

val downto'const : (Direction_flag.t, 'a, 'a) View.t

val upto'const : (Direction_flag.t, 'a, 'a) View.t

val recursive'const : (Rec_flag.t, 'a, 'a) View.t

val nonrecursive'const : (Rec_flag.t, 'a, 'a) View.t
val longident_loc'const: (Longident.t Astlib.Loc.t, 'i, 'o) View.t -> (Longident_loc.t, 'i, 'o) View.t

val lapply'const : ((Longident.t * Longident.t), 'i, 'o) View.t -> (Longident.t, 'i, 'o) View.t

val ldot'const : ((string * Longident.t), 'i, 'o) View.t -> (Longident.t, 'i, 'o) View.t

val lident'const : (string, 'i, 'o) View.t -> (Longident.t, 'i, 'o) View.t
(*$*)
