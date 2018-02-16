# Creating Reliable Interfaces with Elm

The objectives of this workshop are

* Evaluate the role of Elm in front-end web development
* Survey the landscape of Elm development tools
* Deploy a simple Elm application to the web

## What is Elm?

Elm is a new language for developing front-end web sites. Elm compiles to [JavaScript](https://www.ecma-international.org/ecma-262/8.0/index.html), allowing you to readily deploy Elm applications to the web. Elm is not a modification of JavaScript like [CoffeeScript](http://coffeescript.org/) or [TypeScript](https://www.typescriptlang.org/). Elm is a entirely different language than JavaScript, designed from the ground up to be reliable, easy to learn, and fun to use.

What is the problem with using JavaScript for front-end development? Let's define a simple JavaScript function to talk about some of the issues. Here's a function that takes a variable and returns

```js
var hello = function(name) {
  console.log("Hello, " + name);
};

hello("world");
```

We can try call this function [here](https://jsconsole.com/). What happens if you mistype the function name as `Hello` rather than `hello`? You get an error when the program runs. Also, what occurs if you send a number to this function? It still works, but you send an incoherent greeting to your console.

Elm addresses these problems by capturing errors in the static compilation phase rather than the dynamic phase. That is, it catches these error before your program runs. If you can compile an Elm program, then it should run without any errors.

Let's try the same exercises in Elm. We can use an Elm [REPL](http://elmrepl.cuberoot.in/) to test out our code.

```elm
hello name =
   "Hello, " ++ name
```

The REPL returns a bit of information to us, namely, the types of the input and output of the function.

```elm
<function> : String -> String
```

Now we can call the function with our name. Try it out in the REPL. What happens when you call the function with the wrong capitalization? What happens if you try to call it with a number?

Elm goes beyond overcoming the rough points of JavaScript. The benefits of Elm include friendly error messages that help you to learn the language, a package system that guarantees that updates will not break your code, and a friendly community that can help you get started and overcome problems.

A distinctive feature of Elm is the [Elm Architecture](https://guide.elm-lang.org/architecture/). The basic idea is to isolate all the moving parts of your application (i.e. its state) into a model, which you can update and view as HTML.

## Survey of Elm tools

* Install Elm with Homebrew: `brew install elm` or one of the [installers for Windows or Mac](https://guide.elm-lang.org/install.html). The standard installation platform comes with four tools:
 - [elm-repl](https://github.com/elm-lang/elm-repl) or "Read, Evaluate, and Print Loop"
 - [elm-reactor](https://github.com/elm-lang/elm-reactor) or a tool for developing and debugging Elm applications
 - [elm-make](https://github.com/elm-lang/elm-make), a compiler for Elm to HTML/Javascript.
 - [elm-package](https://github.com/elm-lang/elm-package), a tool for importing packages that you program requires.
* Try Elm out online with [Try Elm](http://elm-lang.org/examples/buttons)
* Write full-fledged Elm apps online with [Ellie](https://ellie-app.com/new)

## Deploying a simple Elm application

The Elm website provides [examples of simple Elm programs](http://elm-lang.org/examples). We're going to explore the HTTP example. Try the [version on the website](http://elm-lang.org/examples/http).

Now let's try to run the Elm program locally. If you start `elm-reactor` and point to the file, you'll likely encounter an error message.

```txt
Starting downloads...

  ● elm-lang/virtual-dom 2.0.4
  ● elm-lang/html 2.0.0

  ● elm-lang/core 5.1.1
Packages configured successfully!
I cannot find module 'Http'.

Module 'Main' is trying to import it.

Potential problems could be:
  * Misspelled the module name
  * Need to add a source directory or new dependency to elm-package.json
```

Oh oh! Looks like we are missing the `Http` module. To resolve this problem, we need to use `elm-package` to download and install the missing package: `elm-package install elm-lang/http`. Now try running `elm-reactor` again. Notice that `elm-reactor` provides a debugger that allows you to track all the updates to the application's model.

We can use `elm-reactor` to make changes to our example, adding the ability to change our search term and also using Bootstrap for improved styling. Let's walk through the [changes to the code code](https://gist.github.com/CliffordAnderson/2cc853ce048667dd2cceff312d6e8f37).

Now let's get this application on the web. First, we'll compile the project into JavaScript with `elm-make`: `elm-make giffy.elm`. The output is a file called `index.html`, which packages the CSS, HTML, and JavaScript we need to upload the project to the web. Try the code out for yourself on my [Github repository](http://cliffordanderson.net/elm-projects/).
