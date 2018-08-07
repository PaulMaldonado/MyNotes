class HomeController < ApplicationController
  def index
    @notes = Note.all.order("created_at DESC")
  end

  def unregistered
  end
end
