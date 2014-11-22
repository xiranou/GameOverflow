require "rails_helper"

describe CommentsController do

  describe "Get#index" do
    it "should locate an array of comments form Comment" do
      comment_one = create(:comment)
      comment_two = create(:comment)
      get :index
      expect(assigns[:comments]).to match_array([comment_one, comment_two])
    end

    it "should render :index for comments views" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "Get#show" do
    before do
      @comment = create(:comment)
    end
    it "should locate the requested comment" do
      get :show, id: @comment
      expect(assigns[:comment]).to eq(@comment)
    end

    it "should render :show template for comments views" do
      get :show, id: @comment
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
      @comment = create(:comment)
    end
    it "should locate the requested comment" do
      get :edit, id: @comment
      expect(assigns[:comment]).to eq(@comment)
    end

    it "should render :edit for comments views" do
      get :edit, id: @comment
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
        expect { post :create, comment: attributes_for(:comment, text: nil) }.to_not change(Comment, :count)
      end

      it "should re-render comments#new" do
        post :create, comment: attributes_for(:comment, text: nil)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "Put#update" do
    before :each do
      @comment = create(:comment)
    end
    context 'with valid attributes' do
      it "locates the requested comment" do
        put :update, id: @comment, comment: attributes_for(:comment)
        expect(assigns[:comment]).to eq(@comment)
      end

      it "updates the attributes" do
        put :update, id: @comment, comment: attributes_for(:comment, text: "New test")
        @comment.reload
        expect(@comment.text).to eq("New test")
      end

      it "redirect to the updated comment" do
        put :update, id: @comment, comment: attributes_for(:comment)
        expect(response).to redirect_to(comment_path(@comment))
      end
    end

    context 'with invalid attributes' do
      it "should not updates the attributes" do
        put :update, id: @comment, comment: attributes_for(:comment, text: nil)
        @comment.reload
        expect(@comment.text).to_not eq(nil)
      end

      it "should re-render #edit for comments views" do
        put :update, id: @comment, comment: attributes_for(:comment, text: nil)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "Delete#destroy" do
    before :each do
      @comment = create(:comment)
    end
    it "delete requested comment from database" do
      expect { delete :destroy, id: @comment }.to change(Comment, :count).by(-1)
    end
    it "redirects to #index for comments views" do
      delete :destroy, id: @comment
      expect(response).to redirect_to(comments_path)
    end
  end

  describe "Get#reply" do
    before do
      @parent = create(:comment)
    end
    it "should assign the new reply to be a Comment" do
      get :new_reply, comment_id: @parent
      expect(assigns[:reply]).to be_a_new(Comment)
    end
    it "should render the new form" do
      get :new_reply, comment_id: @parent
      expect(assigns[:reply]).to render_template(:new_reply)
    end
  end

  describe "Post#create_reply" do
    before do
      @parent = create(:comment)
    end
    it "should locate the requested parent comment" do
      post :reply, comment_id: @parent, comment: attributes_for(:comment)
      expect(assigns[:parent]).to eq(@parent)
    end
    it "should save to database" do
      expect { post :reply, comment_id: @parent, comment: attributes_for(:comment) }.to change(Comment, :count).by(1)
    end
    it "should belong to the requested parent comment" do
      post :reply, comment_id: @parent, comment: attributes_for(:comment)
      expect(assigns[:reply].parent).to eq(@parent)
    end
  end

end