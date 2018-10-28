%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Сент. 2018 0:57
%%%-------------------------------------------------------------------
-module(nodTest).
-author("Макс").

-include_lib("eunit/include/eunit.hrl").

nod_test_() -> [
  ?_assertEqual(nod:nod([1]), 1),
  ?_assertEqual(nod:nod([1, 5, 10]), 1),
  ?_assertEqual(nod:nod([100, 50, 25, 125, 1025]), 25),
  ?_assertEqual(nod:nod([3, 18, 19, 25]), 1),
  ?_assertEqual(nod:nod([39, 758, 41, 25]), 1),
  ?_assertEqual(nod:nod([100, 1000, 10000]), 100),
  ?_assertEqual(nod:nod([35, 65, 20]), 5),
  ?_assertEqual(nod:nod([1, 1, 1, 1, 1, 1]), 1)
].
