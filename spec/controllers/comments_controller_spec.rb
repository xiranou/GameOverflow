require "rails_helper"

describe CommentsController do
  before do
    @article = create(:article)
  end
  describe "Get#index" do
    it "should locate the comments of the requested article" do
      comments = [create(:comment, article: @article), create(:comment, article: @article)]
      get :index, article_id: @article
      expect(assigns[:comments]).to match_array(comments)
    end
    it "should render the :index of comments views" do
      get :index, article_id: @article
      expect(response).to render_template :index
    end
  end

  describe "Get#new" do
    it "should locate the requested article for commenting" do
      get :new, article_id: @article
      expect(assigns[:article]).to eq(@article)
    end
    it "should assign a new Comment" do
      get :new, article_id: @article
      expect(assigns[:comment]).to be_a_new(Comment)
    end
    it "should render the :new template for comments" do
      get :new, article_id: @article
      expect(response).to render_template :new
    end
  end

  describe "Post#create" do
    context 'with valid attributes' do
      it "should save into the database" do
        expect{post :create, article_id: @article, comment: attributes_for(:comment, article: @article)}.to change(Comment, :count).by(1)
      end
      it "should redirect to requested article" do
        post :create, article_id: @article, comment: attributes_for(:comment, article: @article)
        expect(response).to redirect_to(article_path(assigns[:article]))
      end
    end
    context 'with invalid attributes' do
      it "should not save into the database" do
        expect{post :create, article_id: @article, comment: attributes_for(:comment, text: nil, article: @article)}.to_not change(Comment, :count)
      end
      it "should re render :new template for comment" do
        post :create, article_id: @article, comment: attributes_for(:comment, text: nil, article: @article)
        expect(response).to render_template :new
      end
    end
  end

  describe "Get#edit" do
    before do
      @comment = create(:comment)
    end
    it "should locate the requested comment" do
      get :edit, article_id: @article, id: @comment
      expect(assigns[:comment]).to eq(@comment)
    end
    it "should render the :edit page for comment" do
      get :edit, article_id: @article, id: @comment
      expect(response).to render_template :edit
    end
  end


end