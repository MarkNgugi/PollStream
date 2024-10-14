class CreatePolls < ActiveRecord::Migration[7.2]
  def change
    create_table :polls do |t|
      t.string :question

      t.timestamps
    end
  end
end
