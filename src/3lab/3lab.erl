%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Сент. 2018 22:18
%%%-------------------------------------------------------------------
-module('3lab').
-author("faystmax@gmail.com").

-compile(export_all).

tree() ->
%%  street_Pid = global:whereis_name(street),
  receive
    wind ->
      io:format("Recived wind from tree~n", [])
  end, tree().

start_tree() ->
  erlang:set_cookie(node(), '3lab'),
  Tree_PID = erlang:spawn('3lab', tree, []),
  global:register_name(tree, Tree_PID).

wind() ->
  tree_Pid = global:whereis_name(tree),
  io:format("Send wind to tree ~n", []),
  tree_Pid ! wind,
  timer:sleep(10000), wind().

start_wind() ->
  erlang:set_cookie(node(), '3lab'),
  Wind_PID = erlang:spawn('3lab', wind, []),
  global:register_name(wind, Wind_PID).