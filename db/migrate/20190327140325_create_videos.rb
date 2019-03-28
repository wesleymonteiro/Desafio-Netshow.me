class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_url
      t.integer :views, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
