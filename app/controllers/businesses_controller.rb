class BusinessesController < ApplicationController

def new
	@business = Business.new
end

def create
	@business = Business.new(params[:business])
	if @business.save
		flash[:notice] = "Welcome to BarCrawler"
		session[:business_id] = @business.id
		redirect_to business_path(@business)
	else
		render 'new'
	end
end

def show
	@business = Business.find(params[:id])
end

def edit
	@business = Business.find(params[:id])
end

def update 
	@business = Business.find(params[:id])
	if @business.update_attributes(params[:post])
		flash[:notice] = "Updated Information"
		redirect_to business_path(@business)
	else
		render 'edit'
	end
end

end