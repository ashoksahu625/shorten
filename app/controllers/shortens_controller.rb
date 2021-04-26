class ShortensController < ApplicationController
  
  def show
    @link = Shorten.where("slug = ? and expires_at >= ?", params[:slug], Time.now).first
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:use_count, @link.use_count + 1)
    redirect_to @link.url
  end
  
  def new
  	@shorten = Shorten.new
  end

  def create
  	@shorten = Shorten.new
  	@shot_url = @shorten.shorten(params[:shorten][:url])
  end

  def stats
  	@links = Shorten.where("expires_at >= DATE(?)", Time.now)
  end

end