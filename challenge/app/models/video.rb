class Video < ApplicationRecord
  belongs_to :user

  validates :title, :views, presence: true
end
