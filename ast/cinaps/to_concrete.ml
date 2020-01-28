let define_conversion_failed ~version =
  Print.newline ();
  Print.println
    "let conversion_failed name = Raise.conversion_failed ~version:%S name"
    version

let print_to_concrete_exn ?(var_name="concrete") ~targs ~node_name expr =
  Print.println "let %s =" var_name;
  Print.indented (fun () ->
    let to_concrete = Name.make ["to_concrete"] targs in
    Print.println "match %s.%s %s with"
      (Ml.module_name node_name)
      to_concrete
      expr;
    Print.println "| None -> conversion_failed %S" node_name;
    Print.println "| Some n -> n");
  Print.println "in"