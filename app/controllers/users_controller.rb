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

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @users }
    # end
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
