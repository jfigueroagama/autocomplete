
class Api::V1::WordsController < ApplicationController
  respond_to :json

  def index
    @words = Word.limit(50)
    respond_with @words
  end

end
