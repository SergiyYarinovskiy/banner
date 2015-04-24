class Location < ActiveRecord::Base
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :url, uniqueness: true, presence: true

  scope :by_url, ->(url) {where url: url}

  def self.banner_selection(url)
    location = Location.by_url(url).first
    unless location.nil?
      images = location.images.select{ |image| image if image.max_show.nil? || image.max_show > image.showed }
      return images.sort {|a, b| a.showed <=> b.showed}.first
    end
    nil
  end
end
