-module(person).
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2]).
-export(
   [ link_and_link/0
   ]).
-record(state, { my_name, linked_name, linked_pid }).

link_and_link() ->
    MyName = lion_king,
    AnotherPersonName = some_gal,
    gen_server:start({local, MyName},
                     ?MODULE,
                     [{my_name,MyName}, {name,AnotherPersonName}],
                     []),
    exit(whereis(AnotherPersonName), kill).
    %exit(whereis(MyName), kill).

% ------ gen_server callbacks -----------------------

init(Args) ->
    process_flag(trap_exit, true),
    MyName = proplists:get_value(my_name, Args),
    AnotherPersonName = proplists:get_value(name, Args),
    case proplists:get_value(linked, Args) of
        undefined -> % Linker case
            case gen_linked(MyName, AnotherPersonName) of
                {ok, LinkedPid} ->
                    {ok, #state{ my_name= MyName,
                                 linked_name= AnotherPersonName,
                                 linked_pid= LinkedPid }};
                {error, Reason} ->
                    {error, Reason}
            end;
        LinkedPid -> % Linkee case
            {ok, #state{ my_name= AnotherPersonName,
                         linked_name= MyName,
                         linked_pid= LinkedPid }}
    end.

handle_info({'EXIT',LinkedPid,_reason}, #state{ my_name= MyName,
                                                linked_name= LinkedName,
                                                linked_pid= LinkedPid }=State) ->
    case gen_linked(MyName, LinkedName) of
        {ok, LinkedPid1} ->
            logger:alert("~p: No, we have to keep linked. Luv you, ~p; you are now ~p.",
                         [{LinkedName,LinkedPid}, {MyName,self()}, LinkedPid1]),
            {noreply, State#state{ linked_pid= LinkedPid1 }};
        {error, Reason} ->
            logger:asert("~p: Sadly we lose link. Luv you, ~p.",
                         [{LinkedName,LinkedPid}, {MyName,self()}]),
            {stop, {error,Reason}, State}
    end.

handle_call(_request, _from, State) ->
    {reply, State, State}.

handle_cast(_msg, State) ->
    {noreply, State}.

% -------- internal ------------------------

gen_linked(LinkerName, LinkeeName) ->
    gen_server:start_link(
      {local,LinkeeName},
      ?MODULE,
      [{my_name,LinkerName}, {name,LinkeeName}, {linked,self()}],
      []).
