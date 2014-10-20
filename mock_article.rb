require_relative 'article.rb'

class MockArticle < Article
  WORD_LIST = ["i", "you", "it", "do", "is", "have", "love", "hate", "school", "computers", "tree",
               "biology", "ball", "desk", "chair", "was", "when", "now", "funny", "black", "blue", 
               "random", "keys", "eat", "fork", "spoon", "there", "not", "mom"]

  def initialize
    super(generate_title, generate_content, generate_author)

    @likes = random_number
    @dislikes = random_number
  end

  def random_number
    rand(101)
  end

  def generate_author
    WORD_LIST.sample(2).map { |str| str.capitalize }.join(" ")
  end

  def generate_title
    WORD_LIST.sample(rand(5) + 1).join(" ").capitalize
  end

  def generate_sentence
    WORD_LIST.sample(rand(6) + 5).join(" ").capitalize + "."
  end

  def generate_content
    content = generate_sentence

    rand(5).times { content += " " + generate_sentence }
    content
  end
end
