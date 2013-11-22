# Guide

First off, let me talk about a *thing* that makes Leptus simple. Parse transformation, the *thing* that saves us some headache, so now we've got a rule,
using the module `leptus_pt` for doing the parse transformation when compiling our request handlers (modules).

So, I suggest you using the following in your request handlers (modules):

```erlang
-compile({parse_transform, leptus_pt}).
```

## Callbacks

There are three callbacks which are required for every request handler `init/3`, `HttpMethod/3` and `terminate/3`.

* init/3
* is_authorized/3
* HttpMethod/3
* terminate/3

#### init/3

```erlang
Module:init(Route, Req, State) -> {ok, State}.
```

#### is_authorized/3

Exporting this callback in a module means that every request that should come to the request handler needs, authorization.

```erlang
Module:is_authorized(Route, Req, State) -> {true, State} | {false, Body, State} | {false, Headers, Body, State}.
```

#### HttpMethod/3

This means `get/3`, `put/3`, `post/3`, `delete/3`.

```erlang
Module:HttpMethod(Route, Req, State) -> {Body, State} | {Status, Body, State} | {Status, Headers, Body, State}.
```

In this case, `Route` must be a pattern matching.

Examples:

```erlang
get("/", Req, State)..;
get("/hello/:name", Req, State)...

post("/new", Req, State)...

put("/:id", Req, State)...

delete("/:id", Req, State)...
```

#### terminate/3

```erlang
Module:terminate(Reason, Req, State) -> ok.
``