class HomeController < ApplicationController
  def index
    @lost_quantity = lost_articles_search.count
    @found_quantity = found_articles_search.count
  end

  def lost_articles
    @articles = lost_articles_search
  end

  def found_articles
    @articles = found_articles_search
  end
  def doc_articles
    @articles = doc_articles_search
  end


  private

  def found_articles_search
    @found_category = Category.where(title: 'Найденное').first
    Article.where(category_id: @found_category)
  end

  def lost_articles_search
    @lost_category = Category.where(title: 'Потерянное').first
    Article.where(category_id: @lost_category)
  end 

  def doc_articles_search
    @doc_category = Subcategory.where(title: 'Документы').first
    Article.where(subcategory_id: @doc_category)
  end 

end
