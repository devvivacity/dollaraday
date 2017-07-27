class ChangeTransactionLockedAtToDatetime < ActiveRecord::Migration
  def up
    change_column(:transactions, :locked_at, :string)
  end

  def down
    change_column(:transactions, :locked_at, :boolean)
  end
end
