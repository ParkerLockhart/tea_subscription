class RemoveStatusFromSubscriptionTeas < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscription_teas, :status, :integer
  end
end
