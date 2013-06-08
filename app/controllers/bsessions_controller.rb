class BsessionsController < ApplicationController

#GET /login
def new
end

#POST /login
def create
	business = Business.where(email: params[:email]).first
	if business
		if business.authenticate(params[:password])
			session[:business_id] = business.id
			flash[:notice] = "Logged In!"
			redirect_to business_path(business)
		else
			flash[:error] = "Incorrect Password"
			redirect_to login_path
		end
	else
		flash[:error] = "Name doesn't exist"
		redirect_to login_path
	end
end

def destroy 
	session[:business_id] = nil
	session[:notice] = "Logged Out"
	redirect_to root_path
end

end