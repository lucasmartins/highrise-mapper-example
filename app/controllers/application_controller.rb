class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_context
    context = nil
    begin
      context = Company.find(session['company_id'])
    rescue Exception => e
      logger.error e
      context = Company.first
    end
    return context
  end
  helper_method :current_context

end
