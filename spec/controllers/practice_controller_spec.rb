require 'spec_helper'

describe PracticeController do
  describe "GET #show" do
    it "assigns the requested practice to @practice" do
      practice = FactoryGirl.create(:practice)
      get :show, id: practice, format: :json
      assigns(:practice).should eq(practice)
    end

    it "renders the :show view" do
      practice = FactoryGirl.create(:practice)
      get :show, id: practice, format: :json
      response.should render_template :show
    end
  end

  describe "POST #create" do
    context "with valid data" do
      it "saves the data in the database" do
        practice = FactoryGirl.attributes_for(:practice)
        expect{post :create, practice: practice}
            .to change(Practice,:count).by(1)
      end
    end

    context "with invalid data" do
      it "raises an ArgumentError" do
        practice = FactoryGirl.attributes_for(:invalid_practice)
        expect{post :create, practice: practice}
            .to raise_error(ArgumentError)
      end
    end
  end
end
