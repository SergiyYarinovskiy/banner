class Image < ActiveRecord::Base
  belongs_to :location

  has_attached_file :banner, styles: {large: '700x350#', medium: '300x150#', thumb: '250x125#', super_thumb: '100x50#'}
  validates_attachment_size :banner, less_than: 10.megabytes
  validates_attachment_content_type :banner, content_type: %w(image/jpeg image/jpg image/png)
  validates :banner, presence: true

  validates :banner, attachment_presence: true
end