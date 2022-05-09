class PhotosController < ApplicationController

  def index

    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index.html.erb" }) 
  end

  def show
    matching_photos = Photo.where({ :id => params.fetch("path_id")})
    @the_photo = matching_photos.at(0)
    render({ :template => "photo_templates/show.html.erb" }) 
  end

  def delete
    matching_photos = Photo.where({ :id => params.fetch("path_id") })
    the_photo = matching_photos.at(0)
    the_photo.destroy
    # render({ :template => "photo_templates/delete.html.erb" }) 
    redirect_to("/photos")
  end

  def create
    
    # Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/chicago-booth-speaker.jpg?cx=0.5&cy=0.42&cw=1280&ch=533&hash=A7E5E3851783B86772FBF1C5337A6C32", "query_caption"=>"Harper Center", "query_owner_id"=>"125"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/create.html.erb" }) 
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

end
