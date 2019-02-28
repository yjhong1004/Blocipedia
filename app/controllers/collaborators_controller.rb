class CollaboratorsController < ApplicationController

  def create
    puts params[:collaborator][:user_id]
    puts params[:collaborator][:wiki_id]
    @wiki = Wiki.find(params[:collaborator][:wiki_id])
    @user = User.find(params[:collaborator][:user_id])
    @collaborator = Collaborator.new(user: @user, wiki: @wiki)
    if @collaborator.save
      flash[:notice] = "#{@user.name} is saved!"
      redirect_to wiki_path
    else
      flash[:error] = "Something went wrong!"
      render template: "wikis/edit"
    end

  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki
    if @collaborator.destroy
      flash[:notice] = "Collaborator deleted"
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error to delete the collaborator"
      render template: "wikis/edit"
    end
  end

end
