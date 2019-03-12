type http

val http : http Functoria.typ

val http_server :
  Mirage_impl_conduit.conduit Functoria.impl -> http Functoria.impl

val httpaf_server :
  Mirage_impl_conduit.conduit Functoria.impl -> http Functoria.impl

type http2

val http2 : http2 Functoria.typ

val http2_server :
  Mirage_impl_conduit.conduit Functoria.impl -> http2 Functoria.impl
