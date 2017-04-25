class PhotosController < ApplicationController

  def new_form
    render("/photos/new.html.erb")
  end

  def create_row
    p = Photo.new
    p.source = params["the_image_url"]
    p.caption = params["the_caption"]
    p.save
    redirect_to("/photos")
    # render("photos/create_row.html.erb")

  end

  def show
    # The params hash looks like this: {"the_id_number"=>"13"}
    id_number = params["the_id_number"]
    p = Photo.find(id_number)
    @the_caption = p.caption
    @the_image_url = p.source
    @created_at = p.created_at


    render("/photos/show.html.erb")
  end

  def index
    @all_photos = Photo.all.order({:created_at => :desc})
    render("/photos/index.html.erb")
  end
end
