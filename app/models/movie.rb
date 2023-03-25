class Movie < ApplicationRecord
  has_many_attached :images
  has_one_attached :video

  validates :title, presence: true
  validates :description, presence: true
  validates :images, content_type: %i[png jpg jpeg], attached: true
  validates :video, content_type: %i[mp4 avi]
end
