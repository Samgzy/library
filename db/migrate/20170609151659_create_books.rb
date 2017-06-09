class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :summary
      t.string :status, default: "available"

      t.timestamps
    end
  end
end
