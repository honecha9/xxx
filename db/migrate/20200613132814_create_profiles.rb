class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :sex
      t.text :like
      t.text :dislike
      t.text :thinking
      t.string :live
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
