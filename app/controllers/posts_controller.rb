class PostsController < ApplicationController
  def index
    @post = Post.new
    # 新しい投稿
    @posts = Post.all
    # すべての投稿
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # ユーザーと投稿を紐づけ
    @post.save
    # 情報を保存
    redirect_to posts_path

  end

  def edit
    @post = Post.new
    # 新規作成用
  end

  def show
    @post = Post.find(params[:id])
    # 主キーに対応するレコードを取り出す
    @post_comment = PostComment.new
    # 新しいコメント
  end

  def destroy
    @post = Post.find(params[:id])
    # 主キーに対応するレコードを取り出す
    @post.destroy
    redirect_to posts_path
  end

  private
  # 投稿データのストロングパラメータ
  def post_params
    params.require(:post).permit(:user_id, :title, :image, :body)
  end
end
