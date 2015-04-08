class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :xml

  def handle_exception
    render json: {:success => false, :message => "something went wrong"}, status: 500
  end
  
  private
  
  def authenticate_api_master!
    invalid_master if api_master_id.blank?
  end
  
  def api_master_id
    master_id = nil
    if !params[:master_id].blank?
      master_id = params[:master_id]
    end
    master_id
  end
  
  def invalid_master
    render :json => {:success => false, :message => "Invalid master id"} 
    return
  end
end
