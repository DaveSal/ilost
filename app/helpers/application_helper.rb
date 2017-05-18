module ApplicationHelper
  def has_access
    current_user && @article.user_id == current_user.id
  end 
end
