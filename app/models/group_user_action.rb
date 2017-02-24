class GroupUserAction < ApplicationRecord
  belongs_to :group_user
  belongs_to :target, class_name: "GroupUsers"
end
