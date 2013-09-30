---
title: "sitemap"
permalink: sitemap.xml
---
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>http://portablepython.com</loc>
        <lastmod>{{site.date|date_to_xmlschema}}</lastmod>
        <changefreq>daily</changefreq>
        <priority>1</priority>
    </url>
    {% for post in site.posts %}
    <url>
        <loc>{{site.url|xml_escape}}{{post.url|xml_escape}}</loc>
        <lastmod>{{page.date|date_to_xmlschema}}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.8</priority>
    </url>
    {% endfor %}
</urlset>
