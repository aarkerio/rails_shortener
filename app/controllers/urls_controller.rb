class UrlsController < ApplicationController
  before_action :set_url, only: [:display, :edit, :update, :destroy, :show]
  before_action :load_urls, only: [:redirect, :create]

  # GET /urls/:url
  def show
  end

  # GET /urls/1/edit
  def edit
  end

  # GET /:url
  def redirect
    url = Url.get_url(params[:url]) if params[:url]
    if url&.original_url
      redirect_to url.original_url
    else
      @url  = Url.new
      respond_to do |format|
        format.html { render :redirect }
      end
    end
  end

  # POST /urls
  def create
    @url = Url.save_url(url_params)

    respond_to do |format|
      if @url.shorted_url
        Resque.enqueue(GetTitle, @url.id)
        format.html { redirect_to url_show_path(@url.shorted_url), notice: 'Shorted Url was successfully created.' }
      else
        format.html { render :redirect }
      end
    end
  end

  private

  def load_urls
    @urls = Url.all.order('visits DESC').limit(100)
  end

  def set_url
    @url = Url.find_by(shorted_url: params[:url])
  end

  # Only allow a list of trusted parameters through.
  def url_params
    params.require(:url).permit(:original_url)
  end

end
