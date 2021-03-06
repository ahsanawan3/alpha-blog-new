class ArticlesController<ApplicationController

	before_action :set_article, only:[:edit,:update,:destroy,:show]

	def new
		@article=Article.new

	end

	def index
		@articles=Article.all

	end

	def edit

	end

	def update
		if @article.update(article_params)
			flash[:notice]="Article updated successfully"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy

		flash[:notice]="Article deleted successfully"
		redirect_to articles_path

	end

	def create
		@article=Article.new(article_params)
		@article.user=User.first
		if @article.save
			flash[:notice]="Article submitted successfully"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def show
	end

	private
	def set_article
		@article=Article.find(params[:id])
	end
	def article_params
			params.require(:article).permit(:title,:description)
	end

end