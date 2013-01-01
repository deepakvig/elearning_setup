class Topic < ActiveRecord::Base

  has_many :chapters

  validates :title, :presence => true
  validates :description, :presence => true
end
