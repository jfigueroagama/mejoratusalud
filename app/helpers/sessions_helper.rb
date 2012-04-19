module SessionsHelper
  
  def sign_in(user)
    session[:remember_token] = user.id
    current_user = user
  end
  
  def sign_out
    session[:remember_token] = nil
    current_user = nil
  end
  
  def signed_in?
    !current_user.nil?
  end
  
# sets current_user  
  def current_user=(user)
    @current_user = user
  end
# gets current_user  
  def current_user
    @current_user ||= User.find(session[:remember_token]) unless session[:remember_token].nil?
  end
  
end
