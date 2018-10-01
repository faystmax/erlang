%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Сент. 2018 22:18
%%%-------------------------------------------------------------------
-module(nod).
-author("faystmax@gmail.com").

-export([nod/2, nod/1]).


nod(A, 0) -> A;
nod(A, B) -> nod(B, A rem B).

nod([A]) -> A;
nod([H1 | [H2 | T]]) -> nod([nod(H1, H2) | T]).
