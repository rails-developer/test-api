require 'rails_helper'

RSpec.describe Api::V1::ResourcesController, :type => :controller do
 render_views
 let(:json) { JSON.parse(response.body) }
 

 describe "GET /show.json" do
   before do
     get :show, format: :json
   end

   context 'show resources data' do
     it 'returns xml file params into json response' do
       expect(json["param_1"]).to include("test")
       expect(json["param_2"]).to include("01-01-2015")
       expect(json["some_code"]).to include("iso-2005")
       expect(json["some_price_param"]).to include("$1000")
     end
   end
 end
end
