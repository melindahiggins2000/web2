---
title: Blog
url: http://melindahiggins2000.github.io
baseurl: /web2
layout: page
---

# Analysis: Fun, Meaningful, Reproducible

<div id="posts">

    {% for post in site.posts offset: 0 limit: 10 %}
    	<h2><a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a></h2>
	    <h5>{{ post.date | date: "%B %d, %Y" }}</h5>
	    {% if post.image %}
	    <p>
	    	<a href="{{ site.url }}{{ site.baseurl }}{{ post.url }}"><img class="centered" src="{{ site.url }}{{ site.baseurl }}/images/blog/{{post.image}}" alt=""></a>
    	</p>
    	{% endif %}
        <p>{{ post.excerpt }} </p>
        <p>	<a class="graybutton" href="{{ site.url }}{{ site.baseurl }}{{ post.url }}">Continue reading</a></p>
        <br/>
        <hr/>
    {% endfor %}

	<p>
	<a class="greenbutton" href="{{ site.url }}{{ site.baseurl }}/blog/archive/" title="an archive of all posts">See all posts &rarr;</a>
	</p>
	
</div>

