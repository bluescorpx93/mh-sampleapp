module SessionsHelper
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	def require_user
		redirect_to common_login_path unless current_user
	end
end
