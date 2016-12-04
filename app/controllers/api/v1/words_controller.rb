class Api::V1::WordsController < ApplicationController
  respond_to :json

  def index
    if params[:keyword].present?
      @keyword = params[:keyword]
      words_search = words_search_build(@keyword)
      @words = Word.where(@where_clause, @where_arg).map(&:word)
      puts "*******************************************"
      puts @words
      puts "*******************************************"
    else
      @words = []
    end
    respond_with @words
  end

  private

  def words_search_build(search_term)
    @where_clause = ''
    @where_arg = {}
    @where_clause << "word LIKE :keyword"
    @where_arg[:keyword] = starts_with(search_term)
  end

  def starts_with(search_term)
    search_term + "%"
  end

end
