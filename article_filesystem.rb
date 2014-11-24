require_relative 'article.rb'

class ArticleFilesystem
  ARTICLES_FOLDER = "./articles/"

  def self.save_article(article)
    article_file = File.new(ARTICLES_FOLDER + article.title.downcase.split.join("_").gsub(/\W/, ""), "w")
    article_file.write("#{article.author}|#{article.title}|#{article.content}|#{article.likes}|#{article.dislikes}")
    article_file.close
  end

  def self.load_article(article_path)
    article_file = File.open(article_path, "r")
    article_information = article_file.first.split("|")
    loaded_article = Article.new(article_information[1], article_information[2], article_information[0])
    article_information[3].to_i.times { loaded_article.like! }
    article_information[4].to_i.times { loaded_article.dislike! }

    article_file.close
    loaded_article
  end
end
