class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many_attached :images
  has_many :reactions

  def feed_body
    char_limit = images.any? ? 100 : 400
    body&.body&.to_plain_text&.first(char_limit)
  end

  def feed_body_truncated?
    body_chars = body&.body&.to_plain_text&.chars&.count || 0
    feed_body_count = feed_body&.chars&.count || 0
    body_chars > feed_body_count
  end
end
