class Image < ActiveRecord::Base
  VALID_KINDS = ['icon', 'illustration']

  has_attached_file :image
  do_not_validate_attachment_file_type :image

  acts_as_taggable

  validates :name, :image, :tag_list, presence: true
  validates :kind, inclusion: { in: VALID_KINDS }

  before_save :downcase_tags

  def downcase_tags
    self.tag_list.each { |tag| tag.downcase! }
  end
end
