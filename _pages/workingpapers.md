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

{% for post in site.workingpapers reversed %}
  {% if post.venue == 'work in progress' %}{% continue %}{% endif %}
  {% include archive-single.html %}
{% endfor %}

## Work in Progress

{% for post in site.workingpapers reversed %}
  {% if post.venue != 'work in progress' %}{% continue %}{% endif %}
  {% include archive-single.html %}
{% endfor %}
