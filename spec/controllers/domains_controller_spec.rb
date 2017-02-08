require 'spec_helper'
require 'rails_helper'

describe DomainsController do

  before :each do
    @user = FactoryGirl.create(:user)

  end

  describe "GET #index" do
    before :each do
      @domain = FactoryGirl.create(:domain, user:@user)
    end

    context "user is logged in" do
      before :each do
        sign_in @user
        get :index
      end
      it "populates an array of domains" do
        expect(assigns(:domains)).to eq([@domain])
      end
      it "renders the :index view" do
        expect(response).to render_template(:index)
      end
    end
    context "user is not logged in" do
      it "redirects to the sign in page" do
        get :index
        expect(response).to redirect_to(new_user_registration_url)
      end
    end

  end

  describe "GET #show" do
    before :each do
      @domain = FactoryGirl.create(:domain, user:@user)
      get :show, params: {id: @domain}
    end

    context "user is logged in" do
      it "locates the requested domain" do
        sign_in @user
        expect(assigns(:domain)).to eq(@domain)
      end
      it "renders the :show view" do
        sign_in @user
        expect(response).to render_template(:show)
      end
    end
    context "user is not logged in" do
      it "redirects to the sign in page" do
        get :show, params: {id: @domain}
        expect(response).to redirect_to(new_user_registration_url)
      end
    end

  end

  describe "GET #new" do

    context "user is signed in" do
      before :each do
        sign_in @user
        get :new
      end
      it "assigns a new domain to @domain" do
        expect(assigns(:domain).id).to be(nil)
      end
      it "renders the :new view" do
        expect(response).to render_template(:new)
      end
    end

    context "user is not signed in" do
      it "redirects to the sign in page" do
        get :new
        expect(response).to redirect_to(new_user_registration_url)
      end
    end


  end

  describe "GET #edit" do
    before :each do
      @domain = FactoryGirl.create(:domain, user:@user)
    end

    context "user is signed in" do
      before :each do
        sign_in @user
        get :edit, params: {id:@domain}
      end
      it "assigns the requested domain to @domain" do
        expect(assigns(:domain)).to eq(@domain)
      end
      # it "renders the :edit view" do
      #   expect(response).to render_template(:edit)
      # end
    end
    context "user is not signed in" do
      it "redirects to the sign in page" do
        get :edit, params: {id:@domain}
        expect(response).to redirect_to(new_user_registration_url)
      end
    end

  end

  describe "POST #create" do

    it "redirects to the sign in page if user is not signed in" do
      post :create, params: {domain: FactoryGirl.attributes_for(:domain, user:@user)}
      expect(response).to redirect_to(new_user_registration_url)
    end

    context "with valid attributes" do
      before :each do
        sign_in @user
      end
      it "saves the new domain in the database" do
        expect{post :create, params: {domain:FactoryGirl.attributes_for(:domain, user:@user)}}.to change{Domain.count}.by(1)
      end
      it "redirects to show domain page" do
        post :create, params: {domain: FactoryGirl.attributes_for(:domain, user:@user)}
        expect(response).to redirect_to(Domain.last)
      end
    end
    context "without valid attributes" do
      before :each do
        sign_in @user
      end
      it "does not save the new domain in the database" do
        expect{post :create, params: {domain:FactoryGirl.attributes_for(:domain,  name:nil)}}.not_to change{Domain.count}
      end
      it "re-renders the :new view" do
        post :create, params: {domain: FactoryGirl.attributes_for(:domain, user:nil)}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @domain = FactoryGirl.create(:domain, user:@user, name:"example1.com")
    end

    it "redirects to the sign page if user is not signed in" do
      put :update, params: {id:@domain, domain: FactoryGirl.attributes_for(:domain, name:"example2")}
      expect(response).to redirect_to(new_user_registration_url)
    end

    context "with valid attributes" do
      before :each do
        sign_in @user
        put :update, params: {id:@domain, domain: FactoryGirl.attributes_for(:domain, name: "example2.com")}
      end
      it "locates the requested domain" do
        expect(assigns(:domain)).to eq(@domain)
      end
      it "updates the domain's attributes" do
        @domain.reload
        expect(@domain.name).to eq("example2.com")
      end
      it "redirects to the updated domain" do
        expect(response).to redirect_to(@domain)
      end
    end
    context "with invalid attributes" do
      before :each do
        sign_in @user
        put :update, params: {id:@domain, domain: FactoryGirl.attributes_for(:domain, name: nil)}
      end
      it "does not change the domain's attributes" do
        expect(@domain.name).to eq("example1.com")
      end
      # it "re-renders the :edit view" do
      #   expect(response).to render_template(:edit)
      # end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @domain = FactoryGirl.create(:domain, user:@user)
    end

    context "user is signed in" do
      it "locates the requested domain" do
        sign_in @user
        expect(assigns(:domain)).to eq(@domain)
      end
      it "deletes the domain" do
        sign_in @user
        expect{delete :destroy, params: {id:@domain}}.to change{Domain.count}.by(-1)
      end
      it "redirects to the domains index path" do
        sign_in @user
        delete :destroy, params: {id:@domain}
        expect(response).to redirect_to(domains_url)
      end

    end
    context "user is not signed in" do
      it "redirects to the root page" do
        delete :destroy, params: {id:@domain}
        expect(response).to redirect_to(new_user_registration_url)
      end
    end

  end

end
