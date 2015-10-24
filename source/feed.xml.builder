xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title settings.purple[:feed][:title]
  xml.id settings.purple[:feed][:root]
  xml.link "href" => settings.purple[:feed][:root]
  xml.link "href" => settings.purple[:feed][:feed_url], "rel" => "self"
  if blog.articles.length > 0
    xml.updated blog.articles.first.date.to_time.iso8601
  end
  xml.author { xml.name settings.purple[:feed][:author_name] }

  blog.articles.first(5).each do |article|
    article_url = article.data[:url] || URI.join(settings.purple[:feed][:root], article.url)

    xml.entry do
      xml.title article.title
      xml.id article_url
      xml.link "rel" => "alternate", "href" => article_url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name settings.purple[:feed][:author_name] }
      xml.summary (article.data[:teaser] || article.summary), "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
