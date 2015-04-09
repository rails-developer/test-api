class Api::V1::ResourcesController < Api::V1::BaseController

  def show
    begin
      @resource = Resource.new.get_xml_result
      respond_to do |format|
        format.json { render json: { :param_1 => @resource[0]["title"] , 
                                     :param_2 => @resource[0]["dob"], 
                                     :some_code => @resource[0]["iso"], 
                                     :some_price_param => @resource[0]["price"] }, status: 201 
                    } 
      end
    rescue => e
      handle_exception
    end
  end
  
  
end



