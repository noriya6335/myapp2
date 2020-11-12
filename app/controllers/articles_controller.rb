class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
    @user = User.find(params[:user_id])
    @article_user = @articles.where(user_id: @user.id)

  end

  def new
    @user = User.find(params[:user_id]) 
    @article= Article.new
  end

  def show
    @articles = Article.all
    @article = Article.find(params[:id])
    @user = User.find(params[:user_id])
    @article_user = @articles.where(user_id: @user.id)
  end

  def create
    @article = Article.new(article_params)

    # articleモデルをDBへ保存
    @article.save

    # showアクションにリダイレクト
    redirect_to user_article_path(id: @article.id)
  end

  def destroy
    @article.destroy

    flash[:notice] = '記事を削除しました'
    redirect_to user_articles_path(current_user.id)
  end

  def update
    @article.update(article_params)
    redirect_to user_articles_path(current_user.id)
  end

  def edit
    @user = current_user
    # @article = Profile.find_by(user_id: @user.id)
  end

  private
  def article_params
    params.require(:article).permit(:image, :text, :title).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
