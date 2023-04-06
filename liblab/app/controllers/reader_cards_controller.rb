class ReaderCardsController < ApplicationController
  before_action :set_reader_card, only: %i[ show edit update destroy ]

  def create
    reader_card = @library.reader_cards.create! params.require(:reader_card).permit(:user, :book)
    redirect_to @library
  end

  def update
    respond_to do |format|
      if @reader_card.update(reader_card_params)
        format.html { redirect_to reader_card_url(@reader_card), notice: "Reader card was successfully updated." }
        format.json { render :show, status: :ok, location: @reader_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reader_card.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_reader_card
      @library = Library.find(params[:library_id])
    end
end
