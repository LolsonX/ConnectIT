class CreateVer1PostTags < ActiveRecord::Migration[6.0]
  def change
    create_table :ver1_post_tags do |t|
      t.references :ver1_post, null: false, foreign_key: true
      t.references :ver1_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
