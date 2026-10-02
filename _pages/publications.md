---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

{% assign topics = "Health Economics|Family and Gender|Industrial Organization and Other Fields" | split: "|" %}
{% for topic in topics %}
## {{ topic }}

<ul class="pub-list">
{% for post in site.publications reversed %}
  {% if post.topic == topic %}{% include publication-item.html post=post %}{% endif %}
{% endfor %}
</ul>
{% endfor %}
