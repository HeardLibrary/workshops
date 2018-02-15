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

## Survey of Elm tools

 * Install Elm with Homebrew: `brew install elm` or one of the [installers for Windows or Mac](https://guide.elm-lang.org/install.html).
   - elm-repl
   - elm-reactor
   - elm-make
   - elm-package
 * Try Elm out online with [Try Elm](http://elm-lang.org/examples/buttons)
 * Write full-fledged Elm apps online with [Ellie](https://ellie-app.com/new)

## Deploy a simple Elm application
