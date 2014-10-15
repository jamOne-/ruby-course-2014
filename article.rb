class Article
  def initialize(title, content, author = "")
    @title, @content, @author = title, content, author
    @likes = @dislikes = 0
    @created_at = Time.now
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

  def include?(what)
    @content.include? what
  end

  def words
    @content.split
  end

  def distinct_words
    words.uniq
  end
end