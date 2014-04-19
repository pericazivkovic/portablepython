---
layout: default
title: "Easy install"
---

One of the options for adding new packages/libraries to Portable Python is `easy-install`. This approach will work for simple libraries but for some more complex it might not as in some cases easy-install adds files outside of the Portable Python folder, which makes this not a portable installation. E.g. in case that easy-install adds files to Windows system32 folder, libraries installed will work only on the same computer where they are installed, if Portable Python is transferred to another computer (copy or run from USB drive) those libraries will not work as target windows environment does not have required files in Windows system32 folder.

### Using easy install
Portable Python scripts folder contains `easy-install.exe` utility that can be used to install new packages. For example, if we would like to install `BeautifulSoup` we need to execute command 

{% highlight text linenos=table %}

App\Scripts\easy_install.exe beautifulsoup4

{% endhighlight %}

on command prompt while located in the root folder of the Portable Python distribution. 

After couple of seconds of processing, easy install will report that installation is complete and we can proceed to use Portable Python that is extended with this new library:

{% highlight text linenos=table %}

Installed ...\site-packages\beautifulsoup4-4.3.2-py2.7.egg
Processing dependencies for beautifulsoup4
Finished processing dependencies for beautifulsoup4

{% endhighlight %}
