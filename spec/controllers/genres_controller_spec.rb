require 'rails_helper'

describe GenresController do

  describe "Get#index" do
    it "should locate an array of games from Genre" do
      genre_one = create(:genre)
      genre_two = create(:genre)
      get :index
      expect(assigns[:genres]).to match_array([genre_one, genre_two])
    end

    it "should render :index for genres views" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Get#show" do
    before do
      @genre = create(:genre)
    end
    it "should locate the requested genre" do
      get :show, id: @genre
      expect(assigns[:genre]).to eq(@genre)
    end

    it "should render :show template for genres views" do
      get :show, id: @genre
      expect(response).to render_template(:show)
    end
  end

  describe "Get#new" do
    it "should assign @genre to a new genre" do
      get :new
      expect(assigns(:genre)).to be_a_new(Genre)
    end
    it "should render :new for genres views" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Get#edit" do
    before do
      @genre = create(:genre)
    end
    it "should locate the requested genre" do
      get :edit, id: @genre
      expect(assigns[:genre]).to eq(@genre)
    end

    it "should render :edit for genres views" do
      get :edit, id: @genre
      expect(response).to render_template(:edit)
    end
  end

  describe "Post#create" do
    context 'valid genres' do
      it "should save the new genre into the database" do
        expect { post :create, genre: attributes_for(:genre) }.to change(Genre, :count).by(1)
      end

      it "redirects to genres#show" do
        post :create, genre: attributes_for(:genre)
        expect(response).to redirect_to(genre_path(assigns[:genre]))
      end
    end

    context 'invalid genres' do
      it "should not save the genre into the database" do
        expect { post :create, genre: attributes_for(:genre, name: nil) }.to_not change(Genre, :count)
      end

      it "should re-render genres#new" do
        post :create, genre: attributes_for(:genre, name: nil)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put#update" do
    before :each do
      @genre = create(:genre)
    end
    context 'with valid attributes' do
      it "locates the requested genre" do
        put :update, id: @genre, genre: attributes_for(:genre)
        expect(assigns[:genre]).to eq(@genre)
      end

      it "updates the attributes" do
        put :update, id: @genre, genre: attributes_for(:genre, name: "New genre")
        @genre.reload
        expect(@genre.name).to eq("New genre")
      end

      it "redirect to the updated genre" do
        put :update, id: @genre, genre: attributes_for(:genre)
        expect(response).to redirect_to(genre_path(@genre))
      end
    end

    context 'with invalid attributes' do
      it "should not updates the attributes" do
        put :update, id: @genre, genre: attributes_for(:genre, name: nil)
        @genre.reload
        expect(@genre.name).to_not eq(nil)
      end

      it "should re-render #edit for genres views" do
        put :update, id: @genre, genre: attributes_for(:genre, name: nil)
        expect(response).to render_template(:edit)
      end
    end
  end


end