class TagsController < ApplicationController
	before_action :require_login, only: [:destroy]
	before_action :access_control_admin, only: [:destroy]
	
	def access_control_admin
		if !current_user.is_admin
			flash.notice = "Access not permit (only Admins can delete tags!)"
			redirect_to tags_path
		end
	end
		
	def show
		@tag = Tag.find(params[:id])
	end
	
	def index
		@tags = Tag.all
	end
	
	def destroy
		@tag = Tag.find(params[:id]).destroy
		redirect_to tags_path
		
		flash.notice = "Tag successfully deleted!"
	end
end
