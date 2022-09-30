---
layout: sub-navigation
order: 10
title: Get started
---

This section contains documentation on what DECS is as a product.

{% for page in collections["get-started"] %}

* [{{ page.data.title }}]({{ page.url | url }}) – {{ page.data.description }}

{% endfor %}