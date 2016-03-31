class Article < ActiveRecord::Base
	has_many :comments,dependent: :destroy
	has_many :taggings,dependent: :destroy
has_many :tags, through: :taggings
has_many :attachments,dependent: :destroy
belongs_to :user
validates :title, :presence => true
validates :description, :presence => true
validates :tags, :presence => true
validates :attachments,:presence => true
def tag_list=(tags_string)
  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags
end
def tag_list
  self.tags.collect do |tag|
    tag.name
  end.join(", ")
end
accepts_nested_attributes_for :attachments,:reject_if => :all_blank, :allow_destroy => true
end
