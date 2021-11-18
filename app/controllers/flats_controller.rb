class FlatsController < ApplicationController
  # index
  # GET /flats
  def index
    if params[:query]
      @search = params[:query]
      @flats = Flat.where("name LIKE '%#{params[:query]}%'")
    else
      @flats = Flat.all
    end
  end

  # new
  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # create
  # POST /flats
  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  # show
  # GET /flats/:id
  def show
    @flat = Flat.find(params[:id])
  end

  # edit
  # GET /flats/edit
  def edit
    @flat = Flat.find(params[:id])
  end

  # update
  # PATCH /flats/:id
  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  # destroy
  # DELETE /flats/:id
  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    redirect_to flats_path
  end

  private

  # strong params
  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
