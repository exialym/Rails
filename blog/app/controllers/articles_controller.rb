class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "q", password: 'q', expect: [:index, :show]

	def new
		@article = Article.new
	end
	
	def create
		@article = Article.new(article_params)
		#在article.rb中，设置了对数据的校验，若校验不通过，则save方法返回false
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	
	def show
		@article = Article.find(params[:id])
	end
	
	def index
		@articles = Article.all
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
		def article_params
			params[:article].permit(:title,:text)
		end
	
end
