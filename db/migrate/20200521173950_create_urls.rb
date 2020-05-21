class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :ourl
      t.string :surl
      t.string :website
      t.integer :visits

      t.timestamps
    end
  end
end
