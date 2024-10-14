class CreateChoices < ActiveRecord::Migration[7.2]
  def change
    create_table :choices do |t|
      t.string :text
      t.integer :votes_count
      t.references :polls, null: false, foreign_key: true

      t.timestamps
    end
  end
end
