class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  def clickbaity?
    clickbait_words = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]
    if clickbait_words.any?{|bait| bait.match(:title)}
      errors.add(:title, " is clickbait-y") 
  end
end
