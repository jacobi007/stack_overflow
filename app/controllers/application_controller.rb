class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :load_top_categories, :load_top_users, :load_statistics



protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :avatar) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end

  def load_top_categories
    @top_categories = Category.all.order('questions_count desc').first(5)
  end

  def load_top_users
    @top_users = User.all.order('points desc').first(10)
  end

  def load_statistics
    @users = User.count
    @threads = Question.count
    @posts = Question.count + Answer.count
  end
end
