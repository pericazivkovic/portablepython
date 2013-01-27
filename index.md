---
layout: default
title: "Welcome To My Sweet Blog"
---
Wooooot !!

{% for site_page in page.site_pages %}
<a href="/coffeescript-backbone-sample{{ site.uri }}{{ site_page }}">{{ site_page.title }}</a>
-
{% endfor %}

{% for post in site.posts %}
<a href="/coffeescript-backbone-sample{{ site.uri }}{{ post.url }}">{{ post.title }}</a>
+
{% endfor %}

{% highlight python linenos %}
def foo:
	pass
	pass

def foo2(self):
	format self
	dir(page)
	print "test"
{% endhighlight %}