class RemoveReferencesFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :references, :string
  end
end
