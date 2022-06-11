class Message < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  validates :content, length: { minimum: 100, too_short: " %{count} characters must be a minimum of 100 characters" }
  validates :title, :content, presence: true
end
