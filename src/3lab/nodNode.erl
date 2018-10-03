%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Сент. 2018 22:18
%%%-------------------------------------------------------------------
-module(nodNode).
-author("faystmax@gmail.com").

-compile(export_all).

nod(A, 0) -> A;
nod(A, B) -> nod(B, A rem B).

nodListener() ->
  receive
    {A, B, NodList_PID} ->
      NodList_PID ! nod(A, B),
      nodListener()
  end.

nodList([A], NodListener_PID) -> NodListener_PID ! {result, A}, A;
nodList([H1 | [H2 | T]], NodListener_PID) ->
  NodListener_PID ! {H1, H2, self()},
  receive
    Nod ->
      io:format("Nod between ~B and ~B = ~B~n", [H1, H2, Nod]),
      nodList([Nod | T], NodListener_PID)
  end.

main(Numbers) ->
  NodListener_PID = spawn(nodProc, nodListener, [self()]),
  spawn(nodProc, nodList, [Numbers, NodListener_PID]),
  receive
    Nod -> io:format("Result Nod = ~B~n", [Nod]), Nod
  end.