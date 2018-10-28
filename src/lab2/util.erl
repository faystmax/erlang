%%%-------------------------------------------------------------------
%%% @author Макс
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Сент. 2018 22:18
%%%-------------------------------------------------------------------
-module(util).
-author("faystmax@gmail.com").

-export([length/1]).

length(List) -> length(List, 0).

length([_], Length) -> Length + 1;
length([_H | T], Length) -> length(T, Length + 1).
