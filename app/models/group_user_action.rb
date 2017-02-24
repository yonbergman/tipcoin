class GroupUserAction < ApplicationRecord
  belongs_to :group_user
  belongs_to :target, class_name: "GroupUsers"

  belongs_to :src_user, through: :group_user
  belongs_to :target_user, through: :target

  after_create :update_balance


  private

  def update_balance
    group_user.balance += change
    group_user.save
  end

end
