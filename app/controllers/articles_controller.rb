class ArticlesController < ApplicationController


	def new
		@article = Article.new
	end

	def index
		@articles = Article.all	
	end

	def show
		@article = Article.find(params[:id])			
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :text))
 		if @article.save
  			redirect_to @article
  		else
  			render 'new'
  		end
  	end

  	def update
  		@article = Article.find(params[:id])
  		@article = Article.update(params.require(:article).permit(:title, :text))
  			redirect_to article_path(@article)
	end

  	def edit
  		@article = Article.find(params[:id])
  	end

	
  	def destroy
  		@article = Article.find(params[:id])
  		@article = Article.destroy(params.require(:article).permit(:title, :text))
  			redirect_to article_path(@article)

  	end

end
