class CreateProgramWorkouts < ActiveRecord::Migration
  def self.up
    create_table :program_workouts do |t|
      t.integer :position
      t.integer :recurrence

      t.timestamps
    end
  end

  def self.down
    drop_table :program_workouts
  end
end
