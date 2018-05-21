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

    url = "https://data.miamigov.com/resource/8vfk-ducx.json"
    all_permits = HTTParty.get(url).parsed_response

    commercial_permits =
    all_permits.select { |permit| permit["propertytype"] == 'Commercial'}

    permits = commercial_permits.map do |permit|
      coords = permit["location_1"]["coordinates"]
      cost = permit["totalcost"]
      scope_of_work = permit["scopeofwork"]

      {
        address: permit["deliveryaddress"],
        permit_number: permit["permitnumber"],
        total_days_in_plan_review: permit["totaldaysinplanreviewnumeric"],
        long: coords.first, lat: coords.last,
        total_cost: cost ? "$#{cost}": "N/A",
        scope_of_work: scope_of_work ? scope_of_work : "N/A"
      }
    end

    gon.permits = permits

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

  protected_methods
  def authenticate_admin
    redirect_to root_path unless current_admin
  end
end
