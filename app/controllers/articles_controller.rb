class ArticlesController < ApplicationController

	## Method used to instanciete the object to create new article.
	def new 
		@article = Article.new
	end

	## Method used to put the values into the object to edit the article.
	def edit
		@article = Article.find(params[:id])
	end

	#Method used to save the article on database
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else 
			render 'new' 
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	# Encapsulate parameters in this method to reuse in others actions.
	private def article_params
		params.require(:article).permit(:title, :text)
	end

end
