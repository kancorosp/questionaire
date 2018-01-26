class AddCommentToQuestionaryResult < ActiveRecord::Migration[5.1]
  def change
    add_column :questionary_results, :comment, :text
  end
end
