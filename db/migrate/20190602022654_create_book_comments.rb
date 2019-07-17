class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :comment
      t.integer :use_id
      t.integer :book_id

      t.timestamps
    end
  end
end
