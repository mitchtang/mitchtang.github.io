---
layout: archive
title: "Working Papers"
permalink: /workingpapers/
author_profile: true
---

{% if author.googlescholar %}
  You can also find my articles on <u><a href="{{author.googlescholar}}">my Google Scholar profile</a>.</u>
{% endif %}

{% include base_path %}

## Working Papers

<ul class="pub-list">
{% for post in site.workingpapers reversed %}
  {% if post.venue != 'work in progress' %}{% include publication-item.html post=post %}{% endif %}
{% endfor %}
</ul>

## Work in Progress

<ul class="pub-list">
{% for post in site.workingpapers reversed %}
  {% if post.venue == 'work in progress' %}{% include publication-item.html post=post %}{% endif %}
{% endfor %}
</ul>
