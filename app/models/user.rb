class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :comments,:dependent => :destroy
         has_many :articles
         has_attached_file :avatar, styles: { medium: "300x300>", thumb: "235x235#",small:'50x50#' }
          validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
          validates :name, :presence => true
end
