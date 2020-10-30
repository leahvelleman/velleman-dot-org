---
layout: default
title: Mixes
permalink: /mixes
---

# Mixes
{% for mix in site.mixes %}
<a href="{{ mix.url }}">{{ mix.title }}</a> ({{ mix.quasidate }}) — {{ mix.tagline }}
{% endfor %}
