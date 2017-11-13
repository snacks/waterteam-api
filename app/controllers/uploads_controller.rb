class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
	protect_from_forgery :except => [:create]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
	#
  # Upload File
	def create
		# First save the file
		Rails.logger.debug params	
		uploaded_io = params[:file]
		device_id = 'DUMMY_0000';
		uploaded_filename = Rails.root.join('uploads', device_id +  uploaded_io.original_filename)
		File.open(uploaded_filename, 'wb') do |file|
			     file.write(uploaded_io.read)
		end 
		@upload = Upload.new(filename: device_id + uploaded_io.original_filename, processed: false)
		@upload.save


    ActiveRecord::Base.transaction do

      # Then insert all the data points
      options = {}
      SmarterCSV.process(uploaded_filename, options) do |chunk|
        chunk.each do |data_hash|
          Rails.logger.debug data_hash
          Rails.logger.debug Time.at(data_hash[:time])
          hash = Hash.new(timestamp:Time.at(data_hash[:time]),  data: data_hash[:data])
          Timeseries.create!( hash )
        end
      end

    end

		
		# TODO: What do we want to return?  Just a 201.
	  render json: {}, status: :created	
	end


  def create_old_unused
    @upload = Upload.new(upload_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:filename, :processed)
    end
end
