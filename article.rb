require 'stamp'

class Article
  attr_reader :title, :content, :author, :likes, :dislikes, :created_at

  def initialize(title, content, author = "", created_at = Time.now)
    @title, @content, @author, @created_at = title, content, author, created_at
    @likes = @dislikes = 0
  end

  def like!
    @likes += 1
  end

  def dislike!
    @dislikes += 1
  end

  def positive_votes
    @likes - @dislikes
  end

  def votes
    @likes + @dislikes
  end

  def shortened_to(limit)
    limit > @content.length ? @content : @content[0...limit - 3] + "..."
  end

  def include?(pattern)
    @content.include?(pattern)
  end

  def words
    @content.split
  end

  def distinct_words
    words.uniq
  end

  def created_stamp
    @created_at.stamp("Sunday, May 1, 2000")
  end
end
