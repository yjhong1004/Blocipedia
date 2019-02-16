class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.string :name
      t.date :time
      t.references :wiki, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
