class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  # mount_uploader :image, ImageUploader
  # GET /news
  # GET /news.json
  def index
    @news_all = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new

  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    response = MetaInspector.new(params[:url])

    @news = News.new(img: response.images.best, title: response.best_title, url: response.url, description: response.description)

    respond_to do |format|
      if @news.save
        format.html { redirect_to home_show_path, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news_all.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to home_show_path, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:img, :title, :url, :description)
    end
end
