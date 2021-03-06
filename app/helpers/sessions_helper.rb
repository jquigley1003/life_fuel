module SessionsHelper
  def sign_in(user)
    # save a cookie on their computer || bouncer creates and gives custom stamp
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    # update our database with their cookie info || bouncer writes down special stamp
    user.update_attribute(:remember_token, User.digest(remember_token))
    # set a current_user variable equal to user
    self.current_user = user       
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    digested_remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: digested_remember_token)
  end

  def curren_user?(user)
    current_user == user
  end

  def signed_in?
    !current_user.nil?
  end

  

  def sign_out
    current_user.update_attribute(:remember_token,
                  User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end