# Date: 9/29/2025, # Time: 8:27 PM

Hey, this is my first session! The project doesn't seem too difficult, but will definitely take some time to implement, especially considering the fact that I'm only a beginner when it comes to writing code in Racket. Firstly, I will implement the algorithm for solving prefix-notation expessions. For now, I will try to use a stack to help get this part done. Secondly, I want to create an user interface. This won't be that much of a challenge.  The remaining stuff such as adding a history of values will be handled last. That's all!


# Date: 9/30/2025, # Time: 10:15 AM

Howdy! So far, I've managed to implement converting the infix expression to prefix. It was a bit of difficult to do because I had to also address the `($n) `tokens, so that they are counted as one, not separate `($ n)`. Another thing was implementing the logic of conversion from an infix to a postfix. I had to account for numerous cases, which could've been easily implemented in another programming langauge such as Python. I had to tidy up my work with because it looked messy with the abundant amount of ()'s and []'s. Anyways, I put this conversion in a separate file called "expression_conversion.rkt". I also made a new file called "main_file.rkt", which of course acts as the container for the conversion file and other new files that will be made in the near future. As for my step, I will implement an algorithm that solves a valid prefix expression. Stay tune!

# Date: 9/30/2025, # Time: 12:03 PM

I just realized that the expression between infix to prefix was wrong, so I committed a fix to it, and also updated the main file as well (just changed the test case for MY USE ONLY)

# Date: 10/2/2025, # Time: 9:07 PM

I have finally the algorithm for evaluating prefix expressions. I also added a history that simply contains the list of previous results. My next goal is to implement the user interface. This part will be simple to do! It will just repeat the same old things (coversion, evaluation, etc) until the user types in "quit" to end it. I believe the only thing left after that will be adding the interactive and batch mode, but the professor has not added the code for that yet. For each file, I also added test cases, so that whenever I run it, I don't have to manually type the function call over and over again. They're mainly for my use, feel free to use it as you please! Until next time!

# Date: 10/7/2025, # Time: 2 PM

I believe I'm done with this project! Boy was I stressing out these past few days. During the duration of this project, I was using DrRacket as the IDE. Everything was fine, however, I realize it didn't offer a command line. I needed access to the command line for the arguments, especially for the batch mode. So, I tried to switch to VS Code. However, I couldn't even use Racket on it, which put me in a huge slump. So I just took it to OIT, and had them fix it. Fortunately, they got it up and running for me! Now, everything is fine! For the completion, I added a new file called "mode.rkt", which I got from the professor. With this, I was able to set up both interactive and batch mode, which was the final requirement of this project. I also fixed the "evaluating_prefix.rkt" because I realize that I had the operands in the wrong order. For instance, entering an expression "2 - 3" gave me 1 as the result instead of -1. I also included a README for the instructions and other important information. That is all!