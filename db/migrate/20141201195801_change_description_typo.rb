class ChangeDescriptionTypo < ActiveRecord::Migration
  def change
    rename_column :projects, :desciption, :description
  end
end
