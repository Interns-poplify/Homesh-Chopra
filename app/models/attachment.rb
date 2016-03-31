class Attachment < ActiveRecord::Base
  belongs_to :article
  has_attached_file :image, styles: { medium: "300x300#", thumb: "235x235#",preview:"480x480#",large:"600>",small:"100x50#",recent:'585x390#'}
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
