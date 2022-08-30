# disclaimer
since I'm not a Python developer, but a Go developer, I can't provide good 
enough list of practices, frameworks and other fancy stuff (well, actually, it
seems kinda impossible to provide any list that would be good enough)

# lab 1 content
I've not used any best practice. I've choosen flask for it's simplicity, didn't
use any linters or formatters (for Go I've used gofumpt and golangci-lint).

It's hard to define a production-ready solution, really much easier to 
*determine* whether the library or a framework is not production ready yet.

There was an opinion that flask is not a production ready as it goes in one 
thread, but that's wrong.

You may launch an nginx instance with a wsgi plugin to make nginx run a flask
app each time a request received, and that will make flask run a several
coroutines per request (some thin configuration might be applied). For 
background task some external services, containers, etc. like postgres might be 
used as a task queue. 

The PHP works almost in the same way.

All of the above is described from my experience in flask (I might be wrong).
