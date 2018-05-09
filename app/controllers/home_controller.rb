class HomeController < ApplicationController
  def new
  end
  def show
    @news = News.new
    @program = Program.new
  end
end
