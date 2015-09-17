class CreateNewHighs < ActiveRecord::Migration
  def change
    create_table :new_highs, :force => true do |t|
      t.string :symbol
      t.datetime :saved_on
      t.timestamps null: false
    end
  end
end
