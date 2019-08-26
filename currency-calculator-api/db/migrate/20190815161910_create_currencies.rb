class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.integer :rate
      t.string :country

      t.timestamps
    end
  end
end
