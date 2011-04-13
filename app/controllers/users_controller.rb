class UsersController < ApplicationController
	def new
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml  { render :xml => @user }
		end
	end

	def index
		@users = User.all
		@user = User.new

		if request.post?
			user = User.find(:first, :conditions=> ['email = ? AND password = ?', params[:email], params[:password]])

			if user.blank?
				# raise "BBd nazwa u|ytkownika lub hasBo"
				else
				session[:user] = user.id
				render "show"
			end
		end
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			render "show"
		end
	end

	def show
		@user = User.find(params[:id])

		respond_to do |format|
			format.html  show.html.erb
			format.xml  { render :xml => @user }
		end
	end

end
