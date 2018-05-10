class HomeController < ApplicationController

  def new
  end


  def show

    @news = News.new
    @news_all = News.all
    
    @program = Program.new
    @programs = Program.all

    @abouts = About.all
    @about = About.new

    render layout: 'cms'
  end
end
