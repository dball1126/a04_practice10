class SessionsController < ApplicationController
    # before_action :ensure_logged_in, except: [:create, :new]

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username],
                                        params[:user][:password])
        if user.nil?
            flash.now[:errors] = ["invalid credentials"]
            render :new
        else
            login(user)
            redirect_to links_url
        end
    end

    def destroy
        logged_out
        redirect_to new_session_url
    end

end