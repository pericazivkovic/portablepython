---
title: "sitemap"
permalink: sitemap.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    {% for site_page in page.site_pages %}
    <url>
        <loc>{{site.url}}</loc>
        <lastmod>{{site.time}}</lastmod>
        <changefreq>daily</changefreq>
        <priority>1.0</priority>
    </url>
    {% endfor %}
    {% for post in site.posts %}
    <url>
        <loc>{{site.url}}</loc>
        <lastmod>{{post.date}}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.8</priority>
    </url>
    {% endfor %}
</urlset>
