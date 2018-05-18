class HomeController < ApplicationController
  before_action :authenticate_admin, except: [:new]
  def new
    @news = News.new
    @news_all = News.all

    @program = Program.new
    @programs = Program.all

    @abouts = About.all
    @about = About.new

    @contacts = Contact.all
    @contact = Contact.new
  end



  def show

    @news = News.new
    @news_all = News.all

    @program = Program.new
    @programs = Program.all

    @abouts = About.all
    @about = About.new

    @contacts = Contact.all
    @contact = Contact.new
    render layout: 'cms'


    end

    protected
    def authenticate_admin
      redirect_to root_path unless current_admin
    end
  end
