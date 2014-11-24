require_relative 'article.rb'
require_relative 'article_filesystem.rb'

class ArticleManager
  def initialize
    @articles = []
  end

  def add_article(new_art)
    @articles.push(new_art)
  end

  def worst_articles
    @articles.sort { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end

  def best_articles
    @articles.sort { |art1, art2| art2.positive_votes <=> art1.positive_votes }
  end

  def worst_article
    @articles.min { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end

  def best_article
    @articles.max { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end

  def most_popular_article
    @articles.max { |art1, art2| art1.votes <=> art2.votes }
  end

  def include?(pattern)
    @articles.select { |art| art.include?(pattern) }
  end

  def authors
    @articles.collect { |art| art.author }.uniq
  end

  def number_of_authors
    authors.length
  end

  def votes
    @articles.inject(0) { |counter, art| counter + art.votes }
  end

  def to_s
    @articles.inject("Listing articles:") { |output, art| output + "\n\t-#{art.title}, #{art.author} (#{art.created_at}) #{art.likes}/#{art.votes}\n\t\t#{art.shortened_to(40)}" }
  end

  def load_articles(directory)
    Dir[directory + '/*'].each { |file| add_article(ArticleFilesystem.load_article(file)) }
  end

  def save_articles
    @articles.each { |art| ArticleFilesystem.save_article(art) }
  end
end
