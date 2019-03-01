class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.references :wiki, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
