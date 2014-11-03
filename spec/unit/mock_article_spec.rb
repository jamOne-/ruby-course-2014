require_relative "../../mock_article.rb"
require "test/unit"

class MockArticleSpec < Test::Unit::TestCase
  def setup
    @mock = MockArticle.new
  end

  def test_random_number
    number = @mock.random_number
    assert(number <= 100 && number >= 0)
  end
end
