require 'rails_helper'

describe ConsolesController do

  describe "Get#index" do
    it "should locate an array of consoles from Console" do
      console_one = create(:console)
      console_two = create(:console)
      get :index
      expect(assigns[:consoles]).to match_array([console_one, console_two])
    end

    it "should render :index for consoles views" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Get#show" do
    before do
      @console = create(:console)
    end
    it "should locate the requested console" do
      get :show, id: @console
      expect(assigns[:console]).to eq(@console)
    end

    it "should render :show template for consoles views" do
      get :show, id: @console
      expect(response).to render_template(:show)
    end
  end

  describe "Get#new" do
    it "should assign @console to a new console" do
      get :new
      expect(assigns(:console)).to be_a_new(Console)
    end
    it "should render :new for consoles views" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Get#edit" do
    before do
      @console = create(:console)
    end
    it "should locate the requested console" do
      get :edit, id: @console
      expect(assigns[:console]).to eq(@console)
    end

    it "should render :edit for consoles views" do
      get :edit, id: @console
      expect(response).to render_template(:edit)
    end
  end

  describe "Post#create" do
    context 'valid consoles' do
      it "should save the new console into the database" do
        expect { post :create, console: attributes_for(:console) }.to change(Console, :count).by(1)
      end

      it "redirects to consoles#show" do
        post :create, console: attributes_for(:console)
        expect(response).to redirect_to(console_path(assigns[:console]))
      end
    end

    context 'invalid consoles' do
      it "should not save the console into the database" do
        expect { post :create, console: attributes_for(:console, name: nil) }.to_not change(Console, :count)
      end

      it "should re-render consoles#new" do
        post :create, console: attributes_for(:console, name: nil)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put#update" do
    before :each do
      @console = create(:console)
    end
    context 'with valid attributes' do
      it "locates the requested console" do
        put :update, id: @console, console: attributes_for(:console)
        expect(assigns[:console]).to eq(@console)
      end

      it "updates the attributes" do
        put :update, id: @console, console: attributes_for(:console, name: "New console")
        @console.reload
        expect(@console.name).to eq("New console")
      end

      it "redirect to the updated console" do
        put :update, id: @console, console: attributes_for(:console)
        expect(response).to redirect_to(console_path(@console))
      end
    end

    context 'with invalid attributes' do
      it "should not updates the attributes" do
        put :update, id: @console, console: attributes_for(:console, name: nil)
        @console.reload
        expect(@console.name).to_not eq(nil)
      end

      it "should re-render #edit for consoles views" do
        put :update, id: @console, console: attributes_for(:console, name: nil)
        expect(response).to render_template(:edit)
      end
    end
  end


end