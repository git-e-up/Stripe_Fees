# class SearchController < ApplicationController
#   def new
#     @search = Search.new
#   end
#   def create
#     search = Search.create ( search_params )
#     search.save
#   end
#
#   def show
#     @search = Search.find(params[:id])
#   end
#
#   private
#
#   def search_params
#     params.require(:search).permit(:key)
#   end
#
# end
