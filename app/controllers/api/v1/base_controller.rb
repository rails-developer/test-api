class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json

  def handle_exception
    render json: {:success => false, :message => "something went wrong"}, status: 500
  end
  
end
