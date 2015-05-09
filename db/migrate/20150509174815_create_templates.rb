class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string  :name, null: false
      t.text    :wrapper
      t.text    :item_template
      t.timestamps null: false
    end
  end
end
