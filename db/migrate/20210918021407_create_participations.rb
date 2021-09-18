class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.references :group, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.integer :role, defalut: 0

      t.timestamps
    end
    add_index :participations, [:group_id, :member_id], unique: true
  end
end
