class Chapter < ActiveRecord::Base
  belongs_to :topic

  validates :title, :presence => true
  validates :description, :presence => true
  validates :topic, :presence => true

  default_scope order("created_at")

  def prev_chapter
    topic.chapters.where("created_at < ?", created_at).order(:created_at).last
  end

  def next_chapter
    topic.chapters.where("created_at > ?", created_at).order(:created_at).first
  end
end
