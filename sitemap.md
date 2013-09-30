---
title: "sitemap"
permalink: sitemap.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    {% for post in site.posts %}
    <url>
        <loc>{{site.url}}{{post.url}}</loc>
        <lastmod>{{post.date}}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.8</priority>
    </url>
    {% endfor %}
</urlset>
