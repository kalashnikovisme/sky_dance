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

  def set_viewed_teacher(viewed_teacher)
    session[:viewed_teacher_id] = viewed_teacher.id
  end

  def viewed_teacher
    viewed_teacher = Teacher.find(session[:viewed_teacher_id])
  end

  def set_viewed_genre(viewed_genre)
    session[:viewed_genre_id] = viewed_genre.id
  end

  def viewed_genre
    viewed_genre = Genre.find(session[:viewed_genre_id])
  end
end
