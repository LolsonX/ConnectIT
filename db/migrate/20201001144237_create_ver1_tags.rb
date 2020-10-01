class CreateVer1Tags < ActiveRecord::Migration[6.0]
  def change
    create_table :ver1_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
