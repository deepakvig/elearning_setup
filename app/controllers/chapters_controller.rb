class ChaptersController < ApplicationController
  before_filter :find_topic
  before_filter :authenticate_user!, :except => [:index, :show]
 
  def index
    @chapters = @topic.chapters.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chapters }
    end
  end

  def show
    @chapter = @topic.chapters.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chapter }
    end
  end

  def new
    @chapter = Chapter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chapter }
    end
  end

  def edit
    @chapter = @topic.chapters.find(params[:id])
  end

  def create
    @chapter = @topic.chapters.build(params[:chapter])

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to [@topic, @chapter], notice: 'Chapter was successfully created.' }
        format.json { render json: @chapter, status: :created, location: @chapter }
      else
        format.html { render action: "new" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @chapter = @topic.chapters.find(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to [@topic,@chapter], notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chapter = @topic.chapters.find(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to topic_chapters_url(@topic) }
      format.json { head :no_content }
    end
  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end
