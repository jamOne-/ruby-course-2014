require_relative "../../article.rb"
require "test/unit"

class ArticleSpec < Test::Unit::TestCase
  def setup
    @art = Article.new("Test_title", "Test content is just a nothing read-worthy and Ala ma kota is fine there. just Test", "Test_author")

    5.times { @art.like! }
    2.times { @art.dislike! }
  end

  def test_likes!
    assert_equal(6, @art.like!)
  end

  def test_dislikes!
    assert_equal(3, @art.dislike!)
  end

  def test_positive_votes
    assert_equal(3, @art.positive_votes)
  end

  def test_votes
    assert_equal(7, @art.votes)
  end

  def test_shortened_to
    assert_equal("Test content is...", @art.shortened_to(18))
    assert_equal("Test content is just a nothing read-worthy and Ala ma kota is fine there. just Test", @art.shortened_to(100))
  end

  def test_words
    assert_equal(["Test", "content", "is", "just", "a", "nothing", "read-worthy", "and", "Ala", "ma", "kota", "is", "fine", "there.", "just", "Test"], @art.words)
  end

  def test_distinct_words
    assert_equal(["Test", "content", "is", "just", "a", "nothing", "read-worthy", "and", "Ala", "ma", "kota", "fine", "there."], @art.distinct_words)
  end
end
