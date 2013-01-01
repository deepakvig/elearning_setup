class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_all_topics

  private

  def get_all_topics
    @topics = Topic.all
  end
end
