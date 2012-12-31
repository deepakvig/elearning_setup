class Topic < ActiveRecord::Base

  has_many :chapters
  has_one :category

  validates :title, :presence => true
  validates :description, :presence => true
end
