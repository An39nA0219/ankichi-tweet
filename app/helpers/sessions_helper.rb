module SessionsHelper
  def current_user
    ##sessionにsessionController内で入れたuser_idを持つUserを、現在使用しているユーザーとして保存
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    ##!=not !!=not*not true or falseが返り値
    !!current_user
  end
end
