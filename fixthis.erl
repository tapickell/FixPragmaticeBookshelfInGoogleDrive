-module(fixthis).
-export([fix/0]).

fix() ->
  {BadFiles,GoodFiles} = bad_and_good_files(all_files()),
  {Fixed,Broken} = fixed_and_broken_bad_files(BadFiles,GoodFiles),
  remove_files(Fixed),
  fix_filenames(Broken, GoodFiles),
  ok.

all_files() ->
  {_,Files} = file:list_dir('.'),
  Files.

bad_and_good_files(F) ->
  lists:partition(fun(X) -> is_bad_ext(filename:extension(X)) end, F).

fix_filenames(FileNames, GoodFiles) ->
  lists:foreach(fun(File) ->
                    case is_already_fixed(File, GoodFiles) of
                      true -> remove_file(File);
                      false -> fix_filename(File)
                    end
                end, FileNames).

fix_filename(File) ->
  file:rename(File, new_filename(File)).

new_filename(File) ->
  [Name|_] = string:tokens(File, "."),
  Name ++ ".epub".

remove_files(Files) ->
  lists:foreach(fun(X) -> remove_file(X) end, Files).

remove_file(File) ->
  try
    {ok,_} = file:delete(File)
  catch
    _:_ -> io:format("Unable to delete file ~s~n", [File])
  end.

fixed_and_broken_bad_files(BadFiles, GoodFiles) ->
  lists:partition(fun(File) -> is_already_fixed(File, GoodFiles) end, BadFiles).

is_already_fixed(FileA, GoodFiles) ->
  lists:any(fun(FileB) -> is_same_file(FileA, FileB) end, GoodFiles).

is_same_file(FileA,FileB) ->
  filename:rootname(FileA) == filename:rootname(FileB).

is_bad_ext(Ext) ->
   length(Ext) > 5.
