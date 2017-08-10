class TimeseriesController < ApplicationController
  before_action :set_timeseries, only: [:show, :edit, :update, :destroy]

  # GET /timeseries
  # GET /timeseries.json
  def index
    @timeseries = Timeseries.all
  end

  # GET /timeseries/1
  # GET /timeseries/1.json
  def show
  end

  # GET /timeseries/new
  def new
    @timeseries = Timeseries.new
  end

  # GET /timeseries/1/edit
  def edit
  end

  # POST /timeseries
  # POST /timeseries.json
  def create
    @timeseries = Timeseries.new(timeseries_params)

    respond_to do |format|
      if @timeseries.save
        format.html { redirect_to @timeseries, notice: 'Timeseries was successfully created.' }
        format.json { render :show, status: :created, location: @timeseries }
      else
        format.html { render :new }
        format.json { render json: @timeseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeseries/1
  # PATCH/PUT /timeseries/1.json
  def update
    respond_to do |format|
      if @timeseries.update(timeseries_params)
        format.html { redirect_to @timeseries, notice: 'Timeseries was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeseries }
      else
        format.html { render :edit }
        format.json { render json: @timeseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeseries/1
  # DELETE /timeseries/1.json
  def destroy
    @timeseries.destroy
    respond_to do |format|
      format.html { redirect_to timeseries_index_url, notice: 'Timeseries was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	# Upload File
	def upload
		# First save the file
		# And actually, this should all happen in a files controller
		
		# Then insert all the data points
		
		# TODO: What do we want to return?  Just a 201.
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeseries
      @timeseries = Timeseries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeseries_params
      params.require(:timeseries).permit(:integer, :datetime, :double)
    end
end
