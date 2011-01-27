class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show

  end
  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      render :text => "success!"
    else
      
      render :action => :new
    end
  end
end
