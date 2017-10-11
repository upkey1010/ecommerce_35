module UsersHelper
  def gravatar_for user, size: 160
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle img-responsive")
  end

  def show_avatar_for user
    image_tag(user.picture.url, class: "img-circle img-responsive")
  end

  def displayed_user_column_names
    User.column_names - %w(id created_at updated_at password_digest remember_digest admin picture) + %w(action)
  end
end
