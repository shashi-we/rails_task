require '../spec_helper'

describe ChargesController , :type => :controller do
  render_views
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#create" do
    it "creates a successful charges" do
      @customer =  FactoryGirl.create(:customer)
      @customer.should be_an_instance_of Customer
    end
  end



  describe "index" do
    it "renders the index template" do
      get :index
      rendered.should eql("Listing widgets")
    end
  end
end