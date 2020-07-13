class AddProblemToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :problem, :string
    add_column :profiles, :solution, :text
  end
end
