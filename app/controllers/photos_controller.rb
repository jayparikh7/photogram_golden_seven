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
    @photo = Photo.find(id_number)

    render("/photos/show.html.erb")
  end

  def index
    @all_photos = Photo.all.order({:created_at => :desc})
    render("/photos/index.html.erb")
  end

  def edit_form
    @edited_photo = Photo.find(params[:the_id])
    render("/photos/edit_form.html.erb")
  end

  def update_row
    id_number = params["the_id"]
    p = Photo.find(id_number)
    p.source = params["the_source"]
    p.caption = params["the_caption"]
    p.save


    redirect_to("/photos")
  end

end
