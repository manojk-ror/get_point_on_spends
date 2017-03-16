class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # def after_sign_up_path_for(resource)
  #   '/'
  # end
  def after_sign_in_path_for(resource)
    (resource.has_role? :admin) ?  users_path : spends_path
  end
end
