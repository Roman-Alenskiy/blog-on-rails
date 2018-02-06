class ArticlesController < ApplicationController
include ArticlesHelper

	before_action :require_login, except: [:show, :index, :new]
	before_action :access_control_article, only: [:edit, :destroy]
	
	def access_control_article
		@article = Article.find(params[:id])
		@author = current_user
		return if current_user.is_admin
		if @article.author_id != @author.id
			redirect_to article_path(@article)
			flash.notice = "You haven't access! This is not your article!"
		end
	end
	
	def index
		@articles = Article.all
	end
	
	def new
		if !logged_in? 
			redirect_to login_path 
		else
			@article = Article.new
		end
	end
	
	def create
		@article = Article.new(article_params)
		@author = current_user
		@article.author_id = @author.id
		@article.save
		redirect_to article_path(@article)
		
		flash.notice = "Article successfully created!"
	end
	
	def destroy
		@article = Article.find(params[:id]).destroy
		redirect_to articles_path
		
		flash.notice = "Article successfully deleted!"
	end
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		
		flash.notice = "Article '#{@article.title}' successfully updated!"
		
		redirect_to article_path(@article)
	end
	
	def show
		@article = Article.find(params[:id])
		@author = current_user
		@comment = Comment.new
		@comment.article_id = @article.id
	end
end
