class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
    @note = Note.all.order("created_at DESC")
  end

  def new
    @note = Note.new
  end

  def show

  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @note = Note.update(note_params)

    if @note.save
      redirect_to @save
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to @note_path
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description)
  end
end
