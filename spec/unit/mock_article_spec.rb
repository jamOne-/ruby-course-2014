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

  def test_generate_author
    author = @mock.generate_author
    assert_equal(author.split.length, 2)
    assert(author.split.inject(true) { |boolean, word| boolean && word.chr == word.chr.capitalize })
  end

  def test_generate_title
    title = @mock.generate_title
    assert_equal(title.capitalize, title)
    assert(title.split.length <= 5 && title.split.length >= 1)
  end

  def test_generate_sentence
    sentence = @mock.generate_sentence
    assert_equal(sentence.capitalize, sentence)
    assert_equal(sentence[sentence.length - 1], ".")
    assert(sentence.split.length >= 5 && sentence.split.length <= 10)
  end

  def test_generate_content
    content = @mock.generate_content
  end
end
