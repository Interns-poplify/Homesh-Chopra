class ArticlesController < ApplicationController
  before_action :authenticate_user! ,:except => [:index,:show,:profile]
	before_action :set_article, only: [:show, :edit, :update, :destroy,:check]
  before_action :check,only:[:edit]
   def check
    
    if current_user.id!=@article.user.id
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'You are Not Authorised to do That' }
        format.json { render :show, status: :ok, location: @article }
    end
  end
  end
	def index
		@articles=Article.all
    
	end
	def show
    @article=Article.find(params[:id])
		@comment = Comment.new
@comment.article_id = @article.id

	end
    def profile
    @user=User.find(params[:id])
  end
	  def new
    
    @article = Article.new
   2.times{@article.attachments.build}
  end
    def create

    
 @article = Article.new(article_params)
 @article.user_id=current_user.id

    respond_to do |format|
      if @article.save

        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        2.times{@article.attachments.build}
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
    #3.times{@article.attachments.build}
    
end
 def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to @article, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.fetch(:article, {}).permit(:title,:description,:tag_list,attachments_attributes: [:article_id,:image])
    end
end
