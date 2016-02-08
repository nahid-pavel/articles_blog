class ArticlesController < ApplicationController

before_action :find_article, only: [:edit,:show,:update,:destroy]
       
        def index

         @articles = Article.all
 
        end

	def new
	 
	  @article = Article.new

	end

        def edit


          


        end

	def create
	   
	  @article = Article.create(article_params)

	    if @article.save

	      flash[:notice] = "New Article Created"

	      redirect_to article_path(@article)
	    else
	      
	      render 'new'
	     
	    end

	end


         def show
           
           

          end

          def update

           
            if @article.update(article_params)

              flash[:notice] = "Article has been edited"
              
              redirect_to article_path(@article)
            else

               render 'edit'
            end
          
          end

       def destroy

        @article.destroy
        flash[:notice] = "Article has been deleted"
        redirect_to articles_path
       

       end

      private

        def article_params

           params.require(:article).permit(:title,:description)

        end

       def find_article

         @article = Article.find(params[:id])

       end

end