class UsersController < ApplicationController

def new
	@user = User.new
end

def create
	@user = User.new(params[:user])
	if @user.save
		flash[:notice] = "Thank for Joining :)"
		session[:user_id] = @user.id
		redirect_to root_path
	else
		render 'new'
	end
end

def show
	@user = User.find(params[:id])
end

def edit
	@user = User.find(params[:id])
end

def update 
	@user = User.find(params[:id])
	if @user.update_attributes(params[:post])
		flash[:notice] = "Updated Information"
		redirect_to root_path
	else
		render 'edit'
	end
end

end