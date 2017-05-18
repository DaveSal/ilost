class Article < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :contact, presence: true

  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '150x150>'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                    content_type: ['image/jpeg', 'image/gif', 'image/png']
end
