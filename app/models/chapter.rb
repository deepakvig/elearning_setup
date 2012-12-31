class Chapter < ActiveRecord::Base
  belongs_to :topic

  validates :title, :presence => true
  validates :description, :presence => true
  validates :topic, :presence => true
end
