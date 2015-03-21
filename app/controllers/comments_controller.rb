class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save 
      redirect_to :back
    else
      render :new
    end 
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment.event
    else
      render :edit
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @event = @comment.event
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :vote_count, :user_id, :event_id, :rating)
  end


end
