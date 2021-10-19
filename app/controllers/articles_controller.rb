class ArticlesController < ApplicationController
   before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new # needed to instantiate the form_for
  end

  def show
  end

  def create
    @article = Article.new(set_task)
    @article.save
    redirect_to articles_path(@article)
  end


  def edit
  end

  def update
    @article.update(set_task)
    redirect_to articles_path(@article)
  end

  def destroy
    @article.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path
  end

  private

  def find_task
    @article = Article.find(params[:id])
  end

  def set_task
    params.require(:article).permit(:title, :content)
  end
end
