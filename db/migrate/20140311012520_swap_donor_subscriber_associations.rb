class SwapDonorSubscriberAssociations < ActiveRecord::Migration
  def up
    add_column :donors, :subscriber_id, :integer


    remove_column :subscribers, :donor_id
  end

  def down
  end
end
