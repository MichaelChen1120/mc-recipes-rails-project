class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :desciption
      t.string :comment
      t.string :rating
      t.timestamps
    end
  end
end
