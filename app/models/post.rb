class ClickbaitValidator < ActiveModel::EachValidator
  def clickbait?(record, attribute, value)
    unless value =~ /(Won't Believe|Secret|Top \d|Guess)/
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title,
end
  