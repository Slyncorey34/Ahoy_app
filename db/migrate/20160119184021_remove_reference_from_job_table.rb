class RemoveReferenceFromJobTable < ActiveRecord::Migration
  def change
  	remove_reference(:jobs, :boats, index: true, foreign_key: true)
  	add_reference(:jobs, :boat, index: true, foreign_key: true)
  end
end
