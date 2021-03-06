class DealsController < ApplicationController
  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
    @featured = Deal.where(featured: true)
    @regular = Deal.where(featured: false)
    @businesses = Business.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deals }
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/new
  # GET /deals/new.json
  def new
    @deal = Deal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deal }
    end
  end

  # GET /deals/1/edit
  def edit
    @deal = Deal.find(params[:id])
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(params[:deal])
    @deal.business_id = current_business.id
    respond_to do |format|
      if @deal.save
        format.html { redirect_to business_path(@deal.business), notice: 'Deal was successfully created.' }
        format.json { render json: @deal, status: :created, location: @deal }
      else
        format.html { render action: "new" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /deals/1
  # PUT /deals/1.json
  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to deals_url }
      format.json { head :no_content }
    end
  end

  def favorites
    @businesses = current_user.businesses
  end

  def mine
    @purchased_deals = current_user.deals.where(waspurchased: true)
    @bookmarked_deals = current_user.deals.where(waspurchased: false)
  end

  def bookmark
    deal = Deal.find(params[:id])
    if !current_user.deals.include? deal
      deal.update_attributes(waspurchased: false)
      current_user.deals << deal
    else
      current_user.deals.delete deal
    end
    redirect_to mine_deals_path
  end

  def redeem
    @deal = Deal.find(params[:id])
    @business = @deal.business
  end

  def final_redeem
    deal = Deal.find(params[:id])
    deal.update_attributes(waspurchased: true)
    current_user.deals << deal
    redirect_to mine_deals_path
  end
end
