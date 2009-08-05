class CreateMonkeys < ActiveRecord::Migration
  def self.up
    create_table :monkeys do |t|
      t.string :name
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :monkeys
  end
end
