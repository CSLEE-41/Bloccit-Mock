class CommentsController < ApplicationController
  
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id]) 
    @comment = @post.comment
  end



  def create
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
      

    if @comment.save
     flash[:notice] = "Comment successfully saved!"
     redirect_to  [@topic, @post]
    else
     flash[:error] = "Something went wrong saving the comment. Please try again."
     redirect_to [@topic, @post]
    end
  end

  def destroy
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error deleting the comment."
      redirect_to [@topic, @post]
    end
  end 



  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end



