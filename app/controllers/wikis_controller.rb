class WikisController < ApplicationController
    # skip_before_action :authenticate_user!, only: [:index]

  def index
    puts "index action is running"
    # @wikis = Wiki.all
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end



  def create
  puts "im here"
  @wiki = Wiki.new(wiki_params)
  @wiki.user = current_user
  authorize @wiki
  if @wiki.save
    flash[:notice] = "Wiki was saved!"
    redirect_to @wiki
  else
    flash[:alert] = "There was an error saving the wiki!"
    render :new
  end
end

  def edit

    if policy(Wiki.find(params[:id])).edit?
          @wiki = Wiki.find(params[:id])

    end

  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    authorize @wiki
     if @wiki.save
       flash[:notice] = "Wiki was updated."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :edit
     end
  end
  def destroy
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end


   private
     def wiki_params
       params.require(:wiki).permit(:title, :body, :private)
     end
end
