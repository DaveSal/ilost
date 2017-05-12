class ArticlesController < ApplicationController
    before_filter :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @article = Article.all.order("created_at DESC")
  end

  def new
    # @pin = current_user.pins.build
    @article = Article.new
  end 

  def create
    # @pin = current_user.pins.build(pin_params)
    @article = Article.new(articles_params)

    if @article.save
      redirect_to @article, notice: "Успешно создано объявление."
    else
      render 'new'
    end
  end

  def show
  end

  def edit
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
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
