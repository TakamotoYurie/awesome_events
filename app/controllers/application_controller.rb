class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?, :current_user

  private

  def logged_in?
    !!session[:user_id]
    # !はnot演算子。2つ重ねるとsession[:user_id]がfalse、nilのときはfalse。それ以外の値はtrueにする。
  end

  def current_user
    return unless session[:user_id]
    # sessionにユーザーidが入っていなければ下のコードは実行しない
    @current_user || = User.find(session[:user_id])
  end

  def authenticate
    return if logged_in?
    # もし、ログインしていたら下のコードは実行しない
    redirect_to root_path, alert: "ログインしてください"
    # ログインしていなかったら、トップページに移動して警告を表示
  end
end
