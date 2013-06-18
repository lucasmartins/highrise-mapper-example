class ContextController < ApplicationController
  def switch
    session['company_id']=params['company_id']
    redirect_to '/'
  end
end