class CreateJoinTableAddressVolunteer < ActiveRecord::Migration
  def change
    create_join_table :addresses, :volunteers do |t|
      t.index [:address_id, :volunteer_id]
      t.index [:volunteer_id, :address_id]
    end
  end
end
