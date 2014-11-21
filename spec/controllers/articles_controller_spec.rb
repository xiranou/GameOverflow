require 'rails_helper'

describe ArticlesController do

	describe 'Get#index' do
		it "should render the article index template" do
			get :index
			expect(response).to render_template :index
		end

		it "should create an array (@articles) of articles to display in the view" do
			article1 = create(:article, title:'first test')
			article2 = create(:article, title:'second test')
			get :index
			expect(assigns(:articles)).to match_array([article1, article2])
		end

	end

	describe 'Get#show' do
		it "should render the template for a single article(show view)" do
			article = create(:article)
			get :show, id: article
			expect(response).to render_template :show
		end

		it "should assign requested article to @articles" do
			article = create(:article)
			get :show, id: article
			expect(assigns(:article)).to eq article
		end

	end

	describe 'Get#edit' do
		it "should render the template for the edit form."
		it "should assign requested article to @article"
	end

	describe 'Put#update' do
		it "should update attributes for requested article"
		it "should redirect back to the updated article"
	end

	describe 'Get#new' do
		it "should render the template for the new article form"
		it "should assign new article to variable @article"
	end

	describe 'Post#create' do
		it "should save the new article to the database"
		it "should redirect back to the new article(show)"
	end

	describe 'Delete#destroy' do
		it "should destroy requested article/delete from database"
		it "should redirect back to articles#index"
	end

end