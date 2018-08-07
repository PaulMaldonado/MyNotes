class NotesController < ApplicationController
  before_action :find_notes, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    redirect_to root_path
  end

  def new
    @note = current_user.notes.build
  end

  def show
    
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note
    else
      render :new
    end
  end

  def edit

  end

  def update
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end

  private

  def find_notes
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description)
  end
end
