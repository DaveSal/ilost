class ArticlesController < ApplicationController
    before_filter :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @article = Article.all.order("created_at DESC")
  end

  def user_articles
    @articles = current_user.articles
  end

  def new
    @article = current_user.articles.build
    @button_title = 'Добавить'
  end 

  def create
    @article = current_user.articles.build(articles_params)

    if @article.save
      redirect_to @article, notice: "Успешно создано объявление."
    else
      render 'new'
    end
  end

  def show
    @comments = @article.comments
  end

  def edit
    @button_title = 'Редактировать'
  end

  def update
    if @article.update(articles_params)
      redirect_to @article, notice: "Успешно обновлено объявление."
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy

    redirect_to root_url
  end

  private

  def articles_params
    params.require(:article).permit(:title, :description, :image, :category_id, :subcategory_id, :contact)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
