class CommentsController < ApplicationController
  before_action :authenticate_user!
before_action :check,only:[:edit]
def check
    @comment=Comment.find(params[:id])
    if current_user.id!=@comment.user.id
      respond_to do |format|
        format.html { redirect_to articles_path, notice: 'You are Not Authorised to do That' }
        format.json { render :show, status: :ok, location: @comment }
    end
  end
  end
	def create
  @comment = Comment.new(comment_params)
  @comment.article_id = params[:article_id]
  @user=User.find(current_user.id)
@comment.user_id=current_user.id

  if @comment.save
    @article=Article.find(params[:article_id]) 
  #redirect_to article_path(@comment.article)
  respond_to do |format|
        format.js

  end  
  end
end
def edit
   
    @comment=Comment.find(params[:id])
    @article=Article.find(params[:article_id])
  end
def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash.notice = "Comment Updated!"
    format.js
    #redirect_to article_path(@comment.article.id)
   end
  def destroy
    @comment=Comment.find(params[:id])
     @article=Article.find(params[:article_id])
     @user=User.find(current_user.id)
     @comment_id=@comment.id
     @comment.destroy
     respond_to do |format|
      format.js
  
end
  end

def comment_params
  params.require(:comment).permit(:body)
end
end
