class AddTextaToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :texta, :text
    add_column :comments, :textb, :text
  end
end
