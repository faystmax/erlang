%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Сент. 2018 0:57
%%%-------------------------------------------------------------------
-module(utilTest).
-author("faystmax@gmail.com").

-include_lib("eunit/include/eunit.hrl").

length_test_() -> [
  ?_assertEqual(util:length([1]), 1),
  ?_assertEqual(util:length([1, 5, 10]), 3),
  ?_assertEqual(util:length([100, 50, 25, 125, 1025]), 5),
  ?_assertEqual(util:length([3, 18, 19, 25]), 4),
  ?_assertEqual(util:length([39, 758, 41, 25]), 4)
].


