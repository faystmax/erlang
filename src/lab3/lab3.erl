%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Сент. 2018 22:18
%%%-------------------------------------------------------------------
-module(lab3).
-author("faystmax@gmail.com").

-compile(export_all).


ping(NodeName, pong) ->
  io:format("Pong from ~s recived...~n", [NodeName]),
  timer:sleep(1000);
ping(NodeName, _) ->
  io:format("Waiting ~s...~n", [NodeName]),
  timer:sleep(1000),
  ping(NodeName, net_adm:ping(NodeName)).


student() ->
  global:whereis_name(street) ! fantic,
  receive
    penalty ->
      io:format("Recived penalty from Police~n"),
      io:format("Start sleep~n"),
      timer:sleep(3000),
      io:format("End sleep~n")
  after
    5000 ->
      io:format("Got nothing from Police~n")
  end, student().

start_student(StreetNodeName) ->
  global:register_name(student, self()),
  ping(StreetNodeName, pang),
  student().


police() ->
  global:whereis_name(street) ! is_fantic,
  receive
    yes ->
      io:format("Recived yes from Street~n"),
      io:format("Sending penalty to student~n"),
      global:whereis_name(student) ! penalty;
    no ->
      io:format("Recived no from Street~n")
  end, timer:sleep(3000), police().

start_police(StudentNodeName) ->
  global:register_name(police, self()),
  ping(StudentNodeName, pang),
  police().


janitor() ->
  global:whereis_name(street) ! is_clean,
  receive
    yes ->
      io:format("Recived yes from Street~n"),
      io:format("Sending cleaned to street~n"),
      global:whereis_name(street) ! cleaned;
    no ->
      io:format("Recived no from Street~n")
  end, timer:sleep(5000), janitor().

start_janitor(StreetNodeName) ->
  global:register_name(janitor, self()),
  ping(StreetNodeName, pang),
  janitor().

street(State) ->
  receive
    leaves ->
      io:format("Recived leaves from tree~n"),
      street(dirty);
    cleaned ->
      io:format("Recived clean from janitor~n"),
      street(clean);
    fantic ->
      io:format("Recived fantic from student~n"),
      street(dirty);
    is_clean ->
      io:format("Recived is_clean from janitor~n"),
      if
        State == clean -> global:whereis_name(janitor) ! no;
        State == dirty -> global:whereis_name(janitor) ! yes
      end, street(State);
    is_fantic ->
      io:format("Recived is_fantic from police~n"),
      if
        State == clean -> global:whereis_name(police) ! no;
        State == dirty -> global:whereis_name(police) ! yes
      end, street(State)
  end.

start_street(JanitorNodeName, PoliceNodeName) ->
  global:register_name(street, self()),
  ping(JanitorNodeName, pang),
  ping(PoliceNodeName, pang),
  street(clean).



tree() ->
  receive
    wind ->
      io:format("Recived wind~n"),
      io:format("Sending leaves to street~n"),
      global:whereis_name(street) ! leaves
  end, tree().

start_tree(StreetNodeName) ->
  global:register_name(tree, self()),
  ping(StreetNodeName, pang),
  tree().


wind() ->
  io:format("Sending wind to tree ~n", []),
  global:whereis_name(tree) ! wind,
  timer:sleep(10000),
  wind().

start_wind(TreeNodeName) ->
  global:register_name(wind, self()),
  ping(TreeNodeName, pang),
  wind().

%% lab3:start_street('janitor@maximuspk.fl.zsttk.ru','police@maximuspk.fl.zsttk.ru').
%% lab3:start_janitor('street@maximuspk.fl.zsttk.ru').
%% lab3:start_tree('street@maximuspk.fl.zsttk.ru').
%% lab3:start_wind('tree@maximuspk.fl.zsttk.ru').
%% lab3:start_police('student@maximuspk.fl.zsttk.ru').
%% lab3:start_student('street@maximuspk.fl.zsttk.ru').

%% lab3:start_street('janitor@max.wifi.astu','police@max.wifi.astu').
%% lab3:start_janitor('street@max.wifi.astu').
%% lab3:start_tree('street@max.wifi.astu').
%% lab3:start_wind('tree@max.wifi.astu').
%% lab3:start_police('student@max.wifi.astu').
%% lab3:start_student('street@max.wifi.astu').