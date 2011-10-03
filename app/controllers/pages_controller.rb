class PagesController < ApplicationController
  def show
    begin
      @page = Page.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :file => "public/404.html", :layout => false, :status => 404
    end
  end

end
