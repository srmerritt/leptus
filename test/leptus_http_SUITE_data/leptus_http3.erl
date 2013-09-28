-module(leptus_http3).

-export([routes/0]).
-export([post/2]).
-export([put/2]).


routes() ->
    ["/user/register", "/settings/change-password"].

post("/user/register", Req) ->
    Body = leptus_req:body_qs(Req),
    Username = proplists:get_value(<<"username">>, Body),
    case Username of
        <<"asdf">> ->
            {403, <<"Username is already taken.">>};
        _ ->
            {201, <<"Thanks for registration.">>}
    end.

put("/settings/change-password", Req) ->
    [
     {<<"password">>, P1}, {<<"password_confirmation">>, P2}
    ] = leptus_req:body_qs(Req),

    if P1 =:= P2 ->
            {200, <<"Your password has been changed.">>};
       true ->
            {403, <<"Passwords didn't match.">>}
    end.