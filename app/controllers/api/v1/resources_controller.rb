class Api::V1::ResourcesController < Api::V1::BaseController
  #before_filter :authenticate_api_master!

  def show
    begin
      @resource = Resource.new.get_xml_result
      respond_to do |format|
        format.json { render json: { :title => @resource[0]["title"] , 
                                     :dob => @resource[0]["dob"], 
                                     :iso => @resource[0]["iso"], 
                                     :price => @resource[0]["price"] }, status: 201 
                    } 
      end
    rescue => e
      handle_exception
    end
  end
  
  
end



