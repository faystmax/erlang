%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Сент. 2018 22:18
%%%-------------------------------------------------------------------
-module(nodProc).
-author("faystmax@gmail.com").

-compile(export_all).


nod(A, 0) -> A;
nod(A, B) -> nod(B, A rem B).

nodList([A], Listener_PID) -> Listener_PID ! A, A;
nodList([H1 | [H2 | T]], Listener_PID) -> nodList([nod(H1, H2) | T], Listener_PID).


listener() ->
  receive
    A ->
      io:format("Listener received ~B~n", [A]),
      listener()
  end.

start(Numbers) ->
  Listener_PID = spawn(nodProc, listener, []),
  spawn(nodProc, nodList, [Numbers, Listener_PID]).