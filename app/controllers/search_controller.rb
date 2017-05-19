class SearchController < ApplicationController
  def index
    @articles = []

    if params[:q]
      @articles = Article.basic_search(params[:q])
    end
  end
end
