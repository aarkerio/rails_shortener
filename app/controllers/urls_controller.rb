class UrlsController < ApplicationController
  before_action :set_url, only: [:display, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
    logger.info " >>>>  I AIM SHOW >>>  #{params.inspect}"
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # GET /:url
  def redirect
    url = Url.get_url(params[:url])
    if url&.ourl
      redirect_to url.ourl
    else
      @url = Url.new
      respond_to do |format|
        format.html { render :redirect }
      end
    end
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.save_url(url_params)
    respond_to do |format|
      if @url.shorted_url
        format.html { redirect_to url_show_path(@url.shorted_url), notice: 'Shorted Url was successfully created.' }
      else
        format.html { redirect_to "/" }
      end
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by(shorted_url: params[:url])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:original_url)
    end
end
