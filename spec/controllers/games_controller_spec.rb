require 'rails_helper'

describe GamesController do

  describe "Get#index" do
    it "should locate an array of games from Game" do
      game_one = create(:game)
      game_two = create(:game)
      get :index
      expect(assigns[:games]).to match_array([game_one, game_two])
    end

    it "should render :index for games views" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Get#show" do
    before do
      @game = create(:game)
    end
    it "should locate the requested game" do
      get :show, id: @game
      expect(assigns[:game]).to eq(@game)
    end

    it "should render :show template for games views" do
      get :show, id: @game
      expect(response).to render_template(:show)
    end
  end

  describe "Get#new" do
    it "should assign @game to a new game" do
      get :new
      expect(assigns(:game)).to be_a_new(game)
    end
    it "should render :new for games views" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Get#edit" do
    before do
      @game = create(:game)
    end
    it "should locate the requested game" do
      get :edit, id: @game
      expect(assigns[:game]).to eq(@game)
    end

    it "should render :edit for games views" do
      get :edit, id: @game
      expect(response).to render_template(:edit)
    end
  end

  describe "Post#create" do
    context 'valid games' do
      it "should save the new game into the database" do
        expect { post :create, game: attributes_for(:game) }.to change(game, :count).by(1)
      end

      it "redirects to games#show" do
        post :create, game: attributes_for(:game)
        expect(response).to redirect_to(game_path(assigns[:game]))
      end
    end

    context 'invalid games' do
      it "should not save the game into the database" do
        expect { post :create, game: attributes_for(:game, name: nil) }.to_not change(game, :count)
      end

      it "should re-render games#new" do
        post :create, game: attributes_for(:game, name: nil)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put#update" do
    before :each do
      @game = create(:game)
    end
    context 'with valid attributes' do
      it "locates the requested game" do
        put :update, id: @game, game: attributes_for(:game)
        expect(assigns[:game]).to eq(@game)
      end

      it "updates the attributes" do
        put :update, id: @game, game: attributes_for(:game, name: "New game")
        @game.reload
        expect(@game.name).to eq("New game")
      end

      it "redirect to the updated game" do
        put :update, id: @game, game: attributes_for(:game)
        expect(response).to redirect_to(game_path(@game))
      end
    end

    context 'with invalid attributes' do
      it "should not updates the attributes" do
        put :update, id: @game, game: attributes_for(:game, text: nil)
        @game.reload
        expect(@game.name).to_not eq(nil)
      end

      it "should re-render #edit for games views" do
        put :update, id: @game, game: attributes_for(:game, name: nil)
        expect(response).to render_template(:edit)
      end
    end
  end


end