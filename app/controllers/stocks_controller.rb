class StocksController < ApplicationController
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])
    end

    if @stock
      # a good way to see if the methods are working is to render the jason version
      # http://localhost:3000/search_stocks?stock=GOOG could be a way to replace console.log
      # render json: @stock
       render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
end
