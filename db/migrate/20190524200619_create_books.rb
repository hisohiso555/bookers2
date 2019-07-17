class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
