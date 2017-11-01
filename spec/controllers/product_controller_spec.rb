require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let(:product) {FactoryGirl.create :product}
  subject {product}

  let(:product_invalid) do
    {
      name: "",
      price: 1000,
      quantity: -1,
      category: 1,
    }
  end

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create, params: {product: FactoryGirl.attributes_for(:product)}}
      it "creates a new product" do
        expect(assigns :product).to be_a Product
      end

      it "redirects to the new product" do
        expect(response).to redirect_to(products_manager_path)
      end
    end

    context "with invalid params" do
      before {post :create, params: {product: product_invalid}}
      it{expect(response).to render_template("new")}
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: subject.id}}
    context "success" do
      it "test message" do
        expect(flash[:success]).to match(I18n.t("success"))
        expect(response).to redirect_to(products_manager_path)
      end
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: subject.id, product:{name: "samsung"}}
        expect(flash[:success]).to match(I18n.t("updated"))
        expect(response).to redirect_to(products_manager_path)
      end
    end

    context "update faild" do
      it "update with category" do
        patch :update, params: {id: subject.id, product:{category_id: 0}}
        expect(response).to render_template("edit")
      end
    end
  end
end
