require "rails_helper"

describe CommentsController do

  describe "Get#index" do
    it "should render :index for comments views" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Get#show" do
    before do
      comment = create(:comment)
    end
    it "should locate the requested comment" do
      get :show, id: comment
      expect(assigns[:comment]).to eq(comment)
    end

    it "should render :show template for comments views" do
      get :show, id: comment
      expect(response).to render_template(:show)
    end
  end

  describe "Get#new" do
    it "should assign @comment to a new Comment" do
      get :new
      expect(assigns(:comment)).to be_a_new(Comment)
    end
    it "should render :new for comments views" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Get#edit" do
    before do
      comment = create(:comment)
    end
    it "should locate the requested comment" do
      get :edit, id: comment
      expect(assigns[:comment]).to eq(comment)
    end

    it "should render :edit for comments views" do
      get :edit, id: comment
      expect(response).to render_template(:edit)
    end
  end

  describe "Post#create" do
    context 'valid comments' do
      it "should save the new comment into the database" do
        expect { post :create, comment: attributes_for(:comment) }.to change(Comment, :count).by(1)
      end

      it "redirects to comments#show" do
        post :create, comment: attributes_for(:comment)
        expect(response).to redirect_to(comment_path(assigns[:comment]))
      end
    end

    context 'invalid comments' do
      it "should not save the comment into the database" do
        expect { post :create, comment: attributes_for(:invalid_comment) }.to_not change(Comment, :count)
      end

      it "should re-render comments#new" do
        post :create, comments: attributes_for(:invalid_comment)
        expect(resposne).to render_template(:new)
      end
    end
  end

end