class CreateFurimaforms < ActiveRecord::Migration[6.0]
  def change
    create_table :furimaforms do |t|

      t.timestamps
    end
  end
end
