require_relative "../../article_manager.rb"
require "test/unit"

class ArticleManagerSpec < Test::Unit::TestCase
  def setup
    @manager = ArticleManager.new

    @test_article_1 = Article.new("Test_Article 1", "I am just a test. Life of a first test article isn't so meaningful.", "Author_1")
    5.times { @test_article_1.like! }
    2.times { @test_article_1.dislike! }
    @manager.add_article(@test_article_1)

    @test_article_2 = Article.new("Test_Article 2", "Well, I'm subsequent article. I really appreciate that! I'm enjoying my life so much. Garbage collector will never catch me... *what?* NOOOOOOOOOOOOOOO", "Forgot my name")
    10.times {@test_article_2.like! }
    @manager.add_article(@test_article_2)

    @test_article_3 = Article.new("Test_Article 3", "I'm da hater - I also suppose people to hate me. So ye, will I achieve 666 dislikes?", "H8r")
    666.times { @test_article_3.dislike! }
    @manager.add_article(@test_article_3)
  end

  def test_worst_articles
    assert_equal([@test_article_3, @test_article_1, @test_article_2], @manager.worst_articles)
  end

  def test_best_articles
    assert_equal([@test_article_2, @test_article_1, @test_article_3], @manager.best_articles)
  end

  def test_worst_article
    assert_equal(@test_article_3, @manager.worst_article)
  end

  def test_best_article
    assert_equal(@test_article_2, @manager.best_article)
  end

  def test_most_popular_article
    assert_equal(@test_article_3, @manager.most_popular_article)
  end

  def test_include?
    assert_equal([], @manager.include?("hehe"))
    assert_equal([@test_article_2], @manager.include?("appreciate"))
    assert_equal([@test_article_1, @test_article_2, @test_article_3], @manager.include?("I"))
  end

  def test_authors
    assert_equal(["Author_1", "Forgot my name", "H8r"], @manager.authors)
  end

  def test_number_of_authors
    assert_equal(3, @manager.number_of_authors)
  end

  def test_votes
    assert_equal(683, @manager.votes)
  end

  def test_to_s
    assert_equal("Listing articles:\n\t-#{@test_article_1.title}, #{@test_article_1.author} (#{@test_article_1.created_at}) #{@test_article_1.likes}/#{@test_article_1.votes}\n\t\t#{@test_article_1.shortened_to(40)}" \
                                + "\n\t-#{@test_article_2.title}, #{@test_article_2.author} (#{@test_article_2.created_at}) #{@test_article_2.likes}/#{@test_article_2.votes}\n\t\t#{@test_article_2.shortened_to(40)}" \
                                + "\n\t-#{@test_article_3.title}, #{@test_article_3.author} (#{@test_article_3.created_at}) #{@test_article_3.likes}/#{@test_article_3.votes}\n\t\t#{@test_article_3.shortened_to(40)}", @manager.to_s)
  end
end
