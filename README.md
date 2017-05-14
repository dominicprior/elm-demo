## elm-demo
My first Elm program: a blob following the mouse around the screen, demonstrating SVG, and mouse and timer events.

To build and run this program:

* install Node.js and Elm

* after cloning, cd to this folder and run elm-reactor (which starts a Node.js server for you)

* visit the server in a browser on localhost:8000

* click on the blob.elm link

(I'm not sure if it was necessary, but I also ran things like `elm-package install elm-lang/mouse`).

You can also run `elm-repl`.

To make the self-contained html file, I ran `elm make blob.elm --output elm-blob.html`:

http://dominicprior.github.io/elm-blob.html

## float-demo
A first attempt at showing Haskell in floating text boxes.  Just a static picture so far.
