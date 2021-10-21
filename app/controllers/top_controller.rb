class TopController < ApplicationController
  def main
    render 'login'
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
      #TODO: ログイン成功したことをユーザに知らせる
      flash[:notice] = 'ログインしました'
      session[:login_uid] = user.uid
      redirect_to root_path
    else
      #TODO: エラーメッセージ
      flash[:notice] = 'ログインに失敗しました'
      render 'login'
    end
  end

  def logout
    #TODO: ログアウトに成功したことをユーザに知らせる
    flash[:notice] = 'ログアウトしました'
    session.delete(:login_uid)
    redirect_to root_path
  end
end
