%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Сент. 2018 0:57
%%%-------------------------------------------------------------------
-module(nodProcTest).
-author("faystmax@gmail.com").

-include_lib("eunit/include/eunit.hrl").

nodProc_test_() -> [
  ?_assertEqual(nodProc:main([1]), 1),
  ?_assertEqual(nodProc:main([1, 5, 10]), 1),
  ?_assertEqual(nodProc:main([100, 50, 25, 125, 1025]), 25),
  ?_assertEqual(nodProc:main([3, 18, 19, 25]), 1),
  ?_assertEqual(nodProc:main([39, 758, 41, 25]), 1),
  ?_assertEqual(nodProc:main([100, 1000, 10000]), 100),
  ?_assertEqual(nodProc:main([35, 65, 20]), 5),
  ?_assertEqual(nodProc:main([1, 1, 1, 1, 1, 1]), 1)
].


