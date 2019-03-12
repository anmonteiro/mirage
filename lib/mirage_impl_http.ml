open Functoria
open Mirage_impl_misc

type http = HTTP
let http = Type HTTP

let cohttp_server conduit = impl @@ object
    inherit base_configurable
    method ty = http
    method name = "http"
    method module_name = "Cohttp_mirage.Server_with_conduit"
    method! packages =
      Mirage_key.pure [ package ~min:"2.1.0" ~max:"3.0.0" "cohttp-mirage" ]
    method! deps = [ abstract conduit ]
    method! connect _i modname = function
      | [ conduit ] -> Fmt.strf "%s.connect %s" modname conduit
      | _ -> failwith (connect_err "http" 1)
  end

let httpaf_server conduit = impl @@ object
    inherit base_configurable
    method ty = http
    method name = "httpaf"
    method module_name = "Httpaf_mirage.Server_with_conduit"
    method! packages =
      Mirage_key.pure [ package "httpaf-mirage" ]
    method! deps = [ abstract conduit ]
    method! connect _i modname = function
      | [ conduit ] -> Fmt.strf "%s.connect %s" modname conduit
      | _ -> failwith (connect_err "httpaf" 1)
  end

type http2 = HTTP2
let http2 = Type HTTP2

let http2_server conduit = impl @@ object
    inherit base_configurable
    method ty = http2
    method name = "http2af"
    method module_name = "Http2af_mirage.Server_with_conduit"
    method! packages =
      Mirage_key.pure [ package "http2af-mirage" ]
    method! deps = [ abstract conduit ]
    method! connect _i modname = function
      | [ conduit ] -> Fmt.strf "%s.connect %s" modname conduit
      | _ -> failwith (connect_err "http2af" 1)
  end
