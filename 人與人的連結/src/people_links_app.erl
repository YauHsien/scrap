%%%-------------------------------------------------------------------
%% @doc people_links public API
%% @end
%%%-------------------------------------------------------------------

-module(people_links_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    people_links_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
