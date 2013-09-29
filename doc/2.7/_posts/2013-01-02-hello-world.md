---
layout: default
title: "Hello world"
---

Like any other Python distribution, in Portable Python you can execute your scripts from interactive prompt or by passing script name to the Python engine.

### Interactive mode
When you start Portable Python executable `Python-Portable.exe` without passing python file as an argument, you will start interactive mode where commands are evaluated as you enter them.

{% highlight python linenos=table %}

Python 2.7.5 (default, May 15 2013, 22:43:36) [MSC v.1500 32 bit (Intel)] on win32
Type "help", "copyright", "credits" or "license" for more information.
Portable Python >>>

{% endhighlight %}

In this mode variables are echoed after they are entered

{% highlight python linenos=table %}

Python 2.7.5 (default, May 15 2013, 22:43:36) [MSC v.1500 32 bit (Intel)] on win	32
Type "help", "copyright", "credits" or "license" for more information.
Portable Python >>> 42
42
Portable Python >>> "Hello World"
'Hello World'
Portable Python >>> 1+1
2
Portable Python >>> my_variable = 17
Portable Python >>> my_variable
17
Portable Python >>> print("Hello World")
Hello World
Portable Python >>>

{% endhighlight %}

### Passing (executing) script files
Portable Python executable (`Python-Portable.exe`) can execute python script files if you pass them as parameters from the command line. For example if we save following code to file named `hello.py`

{% highlight python linenos=table %}

print("Hello world")
	
a = True
if a == True:
	print("It is true!")
else:
	print("It is false...")

b = raw_input("Enter value:")
print("Your value is")
print(b)

raw_input("Press enter to continue...")

{% endhighlight %}

we can execute it from windows command line by typing `Python-Portable.exe hello.py`. New command window will open and you will be prompted to enter value. After you enter some text or number, it will be printed back to the screen and program will end.

{% highlight bat linenos=table %}

Hello world
It is true!
Enter value:42
Your value is
42
Press enter to continue...

{% endhighlight %} 

Python built-in function `raw_input` is used in this case to get input from the user and to pause execution at the end of the script until user presses enter key.