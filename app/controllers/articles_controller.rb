class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        # render plain: params[:article]
        # renders to browser screen
        @article = Article.new(article_params)
        @article.user = User.first
        # A secrutiy function in rails requires you to state what fields specifically it uses. more on this in lecture 88
        if @article.save
        # saves newly made article from the content we got above to the database.
        flash[:notice] = "article was created succesfully."
        redirect_to @article
        else 
            render 'new'
        end
        # we now redirect uses to the new article they made. Ruby automatifcally extracts the id from the article content no need to worry about that.
    end

    def edit   
    end

    def update 
        if @article.update(article_params)
            flash[:notice] = "Article was updated succesfully"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy       
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end