class CreateSpeaks < ActiveRecord::Migration
  def change
    create_table :speaks do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
