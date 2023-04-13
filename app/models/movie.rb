require 'open-uri'

class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :image, content_type: %i[png jpg jpeg], attached: true

  attr_accessor :image_url

  def attach_omdb_image(image)
    self.image.attach(io: URI.open(image), filename: File.basename(image))
  end
end
