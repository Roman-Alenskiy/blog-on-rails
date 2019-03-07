module ArticlesHelper
	def article_params
		params[:article][:body] = Sanitize.fragment(params[:article][:body], Sanitize::Config::BASIC)
		params.require(:article).permit(:title, :body, :tag_list, :image)
	end
end
