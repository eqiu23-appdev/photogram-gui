class UsersController < ApplicationController
    def index
      matching_users = User.all
      @list_of_users = matching_users.order({ :username => :asc })
      render({ :template => "user_templates/index.html.erb" })
    end

    def show
      url_username = params.fetch("path_username")
      matching_usernames = User.where({ :username => url_username})
      @the_user = matching_usernames.first

      # redirect optional
      if @the_user == nil
        redirect_to("/404")
      else
        render({ :template => "user_templates/show.html.erb" })
      end
    end

    def create
      a_new_user = User.new
      a_new_user.username = params.fetch("input_username")
      a_new_user.save
      redirect_to("/users/" + a_new_user.username)
    end

    def update

      matching_users = User.where({ :id => params.fetch("path_id") })
      the_user = matching_users.at(0)

      the_user.username = params.fetch("query_username")
      the_user.save

      redirect_to("/users/" + the_user.username)
    end
end
