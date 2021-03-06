% Copyright (c) 2008, Travis Vachon
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
%
% * Redistributions of source code must retain the above copyright
% notice, this list of conditions and the following disclaimer.
%
% * Redistributions in binary form must reproduce the above copyright
% notice, this list of conditions and the following disclaimer in the
% documentation and/or other materials provided with the distribution.
%
% * Neither the name of the author nor the names of its contributors
% may be used to endorse or promote products derived from this
% software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
% A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
% OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
% SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
% TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
% PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
% LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
% NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
% SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%

% Nina made it simpler to use 24/09/2009 by adding get_uuid and hid the other functions. 
% Changed it to use the much more random crypto:rand_uniform instead of random:uniform as in the original

-module(uuid).
-export([get_uuid/0]).
-import(random).
 
get_uuid() ->
	to_string(v4()).

v4() ->
	Arg1 = round(math:pow(2, 48)),
	Arg2 = round(math:pow(2, 12)),
	Arg3 = round(math:pow(2, 32)),
	Arg4 = round(math:pow(2, 30)),
	
    v4(crypto:rand_uniform(1,Arg1) - 1, crypto:rand_uniform(1,Arg2) - 1, crypto:rand_uniform(1,Arg3) - 1, crypto:rand_uniform(1,Arg4) - 1).

v4(R1, R2, R3, R4) ->
    <<R1:48, 4:4, R2:12, 2:2, R3:32, R4: 30>>.

to_string(U) ->
    lists:flatten(io_lib:format("~8.16.0b-~4.16.0b-~4.16.0b-~2.16.0b~2.16.0b-~12.16.0b", get_parts(U))).
 
get_parts(<<TL:32, TM:16, THV:16, CSR:8, CSL:8, N:48>>) ->
    [TL, TM, THV, CSR, CSL, N].