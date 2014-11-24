require 'open-uri'
require 'nokogiri'
require 'openssl'
require_relative 'article'
require_relative 'article_manager'

class NewsDownloader
  def self.download_newest
    page = Nokogiri::HTML(open("https://zapisy.ii.uni.wroc.pl/news/", {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
    articles = ArticleManager.new

    page.css("div.od-news-item").each do |article|
      title = article.css("div.od-news-header h3").text
      author = article.css("div.od-news-footer").text
      author = author.split(" ").join(" ")
      content = article.css("div.od-news-body").text
      content = content.split(" ").join(" ")

      #PRZYKŁADOWA DATA: Piątek, 21.02.2014 - 11:32
      time_text = article.css("div.od-news-header span.od-news-date").text
      (time_text =~ %r{(\d\d)\.(\d\d)\.(\d\d\d\d) - (\d+):(\d\d)}) ? created_time = Time.new($3.to_i, $2.to_i, $1.to_i, $4.to_i, $5.to_i) : created_time = Time.now

      articles.add_article(Article.new(title, content, author, created_time))
    end

    articles
  end
end
