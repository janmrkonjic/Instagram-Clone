class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.turbo_stream { render turbo_stream: turbo_stream.append("comments-#{@comment.post.id}", partial: "comments/comment", locals: { comment: @comment }) + turbo_stream.replace("new_comment_#{@comment.post.id}", partial: "comments/form", locals: { comment: @comment.post.comments.build })}
        format.html { redirect_to @comment.post, notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    comment_id = @comment.id
    post = @comment.post
    @comment.destroy!
    # redirect_to comments_url, notice: "Comment was successfully destroyed.", status: :see_other
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("comment_#{comment_id}") }
      format.html { redirect_to post_path(post), notice: "Comment was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id]) rescue nil
      if @comment.nil?
        redirect_to root_path, alert: "Comment not found", status: :not_found
      end
      if @comment.user != current_user
        redirect_to @comment.post, alert: "You can't delete other user's comment", status: :forbidden
      end
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :text)
     end
end
