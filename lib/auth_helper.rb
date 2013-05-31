module AuthHelper
  def admin_sign_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_signed_in?
    session[:admin_id] && Admin.find_by_id(session[:admin_id])
  end

  def admin_sign_out
    session[:admin_id] = nil
  end
  
  def authenticate_admin?(admin, password)
    admin.password === password
  end
end
