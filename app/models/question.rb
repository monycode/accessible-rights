class Question < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :answers
  validates :title, :content, presence: true
  validates :content, length: { minium: 100, too_short: " %{count} characters must be a minimum of 100 characters" }
end
