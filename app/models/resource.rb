require 'nokogiri'
require 'open-uri'

class Resource

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  
  def get_xml_result
    xml = Nokogiri::XML(open("#{Rails.root}/public/resources.xml"))
    resources = xml.search('resource').map do |resource|
      %w[
        title dob iso price
        ].each_with_object({}) do |n, o| 
          o[n] = resource.at(n).text
	end
    end
    resources
  end

end




