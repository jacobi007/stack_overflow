class AddQuestionsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :questions_count, :integer, null: false, default: 0

    Category.all.each do |c|
      c.update_attribute :questions_count, c.questions.count
    end

  end
end
