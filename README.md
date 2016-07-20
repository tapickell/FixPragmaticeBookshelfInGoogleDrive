## My Pragmatic Bookshelf Fix

This is related to an issue syncing ebooks from [Pragmatic Programmers](https://pragprog.com)
using Google Drive via `https://pragprog.com/distribute_all/google_drive` link.

Using this link would create the `./My Pragmatic Bookshelf` directory in
Google Drive and then pull all the ebooks down.
When the ebooks finished syncing however there is an issue with the
filenames.

I would get

`Programming Erlang (2nd edition).epub20160716-29016-114uvrl`

instead of

`Programming Erlang (2nd edition).epub`

I am still uncertain if this issue is with Google Drive or the Pragmatic
Programmers site. I have contacted Pragmatic Programmers support and
they are looking into it. I have never seen this issue with any other
files in Google Drive.

For now I wanted to come up with a quick solution to ensure the
integrity of the filenames that are synced down to this folder until this
issue is resolved.

Why Erlang? Because I was reading [Learn You Some
Erlang](http://learnyousomeerlang.com/) when I encountered this issue
and saw an opportinuty to use Erlang to solve a problem.

Isn't using Erlang overkill for such a simple file renaming script?
Yes... yes it is.
