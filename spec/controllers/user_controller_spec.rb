require "rails_helper"
RSpec.describe UsersController, type: :controller do
  let (:user) {FactoryGirl.create :user}
  subject {user}

  let (:invalid_user) do
    {
      name: Faker::Lorem.characters(55),
      email: "upkey1010@gmail.com",
      password: "123",
      password_confirmation: "123",
      address: "Da nang",
      admin: false,
      phone: "09785751599",
    }
  end

  describe "GET index" do
    render_views
    it "has a 302 status code" do
      get :index
      expect(response.status).to eq(302)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create, params: {user: FactoryGirl.attributes_for(:user)}}
      it "create new user" do
        expect(assigns :user).to be_a User
        end

      it "show the success flash" do
        expect(flash[:success]).to be_present
      end

      it "redirect to user" do
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid attributes" do
      render_views
      before {post :create, params: {user: invalid_user}}
      it "render new view" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    render_views
    before :each do
      get :edit, params: {id: user.id}
    end
    it "assings the requested user to @user" do
      expect(assigns(:user)).to eq user
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        session[:user_id] = user.id
        patch :update, params: {id: subject.id, user:{name: "Tin Nguyen"}}
        expect(flash[:success]).to be_present
        expect(response).to redirect_to user_path
      end
    end
  end

  describe "GET #show" do
    before do
      get :show, params: {id: user.id}
    end
    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq user
    end
    it "renders the #show view" do
      expect(response).to render_template :show
    end
  end
end
