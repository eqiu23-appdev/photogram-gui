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
end
