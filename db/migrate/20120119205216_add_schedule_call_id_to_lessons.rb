class AddScheduleCallIdToLessons < ActiveRecord::Migration
  def change
    change_table :lessons do |t|
      t.integer :schedule_call_id
    end
  end
end
