class CreateVer1Posts < ActiveRecord::Migration[6.0]
  def change
    create_table :ver1_posts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :media

      t.timestamps
    end
  end
end
