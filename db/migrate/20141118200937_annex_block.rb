class AnnexBlock < ActiveRecord::Migration
  def change
    create_table :annex_blocks do |t|
      t.string :route
      t.text :content
    end
  end
end
