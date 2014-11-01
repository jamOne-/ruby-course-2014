require_relative 'article.rb'

class ArticleFilesystem
  ARTICLES_FOLDER = "./articles/"

  def self.save_article(article)
    file_article = File.new(ARTICLES_FOLDER + article.title.downcase.split.join("_"), "w")
    file_article.write("#{article.author}|#{article.title}|#{article.content}|#{article.likes}|#{article.dislikes}")
  end
end
