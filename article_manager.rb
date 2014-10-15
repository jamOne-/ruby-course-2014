require_relative 'article.rb'

class ArticleManager
  def initialize
    @articles = []
  end

  def add_article(new_art)
    @articles.push(new_art)
  end

  def delete_article(art)
    @articles.delete(art)
  end

  def worst_articles
    raise_if_empty
    @articles.sort { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end

  def best_articles
    raise_if_empty
    @articles.sort { |art1, art2| art2.positive_votes <=> art1.positive_votes }
  end

  def worst_article
    raise_if_empty
    @articles.min { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end

  def best_article
    raise_if_empty
    @articles.max { |art1, art2| art1.positive_votes <=> art2.positive_votes }
  end

  def most_popular_article
    raise_if_empty
    @articles.max { |art1, art2| art1.votes <=> art2.votes }
  end

  def include?(pattern)
    raise_if_empty
    @articles.keep_if { |art| art.include?(pattern) }
  end

  def authors
    raise_if_empty
    @articles.collect { |art| art.author }.uniq!
  end

  def number_of_authors
    raise_if_empty
    authors.length
  end

  def votes
    raise_if_empty
    @articles.inject(0) { |counter, art| counter + art.votes }
  end

  def to_s
    raise_if_empty
    output = "Listing articles:"
    @articles.each { |art| output += "\n\t-#{art.title}, #{art.author} (#{art.created_at}) #{art.likes}/#{art.votes}\n\t\t#{art.shortened_to(40)}" }

    output
  end

  def raise_if_empty
    raise "No articles in manager!" if @articles.length == 0
  end
end
