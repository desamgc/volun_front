class PagesController < ApplicationController
  def show
    render action: params[:id]
  rescue ActionView::MissingTemplate
    head 404
  end
end
