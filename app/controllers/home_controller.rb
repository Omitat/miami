class HomeController < ApplicationController
  def new
  end


  def show
    @news = News.new
    @news_all = News.all
    @program = Program.new
    @programs = Program.all
  end
end
