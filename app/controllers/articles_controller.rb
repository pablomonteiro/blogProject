class ArticlesController < ApplicationController

	def new 
	end

	def create
		@article = Article.new(article_params)
		@article.save
		redirect_to @article
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