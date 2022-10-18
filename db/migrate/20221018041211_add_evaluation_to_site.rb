class AddEvaluationToSite < ActiveRecord::Migration[6.1]
  def change
    add_column :sites, :evaluation, :float
  end
end
