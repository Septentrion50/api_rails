class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :creator?, only: [:update, :destroy]

  # GET /articles
  def index
    @articles = Article.all.where(status: false)
    @articles.each_with_index { |a, index|
      a.image_path = @articles[index].get_image_url()
    }

    render json: @articles
  end

  # GET /articles/1
  def show
    if @article.status == false || @article.user == current_user
      if @article.image.attached?
      render json: @article.as_json().merge(image_path: @article.get_image_url())
      else
        render json: @article
      end
    else
      render json: @article.errors ,status: :forbidden
    end
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, :status, :image)
    end

    def creator?
      @article = Article.find(params[:id])
      unless @article.user == current_user
        render json: @article.errors, status: :unauthorized
      end
    end
end
