# Date: 9/29/2025, # Time: 8:27 PM

Hey, this is my first session! The project doesn't seem too difficult, but will definitely take some time to implement, especially considering the fact that I'm only a beginner when it comes to writing code in Racket. Firstly, I will implement the algorithm for solving prefix-notation expessions. For now, I will try to use a stack to help get this part done. Secondly, I want to create an user interface. This won't be that much of a challenge.  The remaining stuff such as adding a history of values will be handled last. That's all!


# Date: 9/30/2025, # Time: 10:15 AM

Howdy! So far, I've managed to implement converting the infix expression to prefix. It was a bit of difficult to do because I had to also address the `($n) `tokens, so that they are counted as one, not separate `($ n)`. Another thing was implementing the logic of conversion from an infix to a postfix. I had to account for numerous cases, which could've been easily implemented in another programming langauge such as Python. I had to tidy up my work with because it looked messy with the abundant amount of ()'s and []'s. Anyways, I put this conversion in a separate file called "expression_conversion.rkt". I also made a new file called "main_file.rkt", which of course acts as the container for the conversion file and other new files that will be made in the near future. As for my step, I will implement an algorithm that solves a valid prefix expression. Stay tune!

# Date: 9/30/2025, # Time: 12:03 PM

I just realized that the expression between infix to prefix was wrong, so I committed a fix to it, and also updated the main file as well (just changed the test case for MY USE ONLY)