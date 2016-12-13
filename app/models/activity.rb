# ## Schema Information
#
# Table name: `activities`
#
# ### Columns
#
# Name              | Type               | Attributes
# ----------------- | ------------------ | ---------------------------
# **`id`**          | `integer`          | `not null, primary key`
# **`created_at`**  | `datetime`         | `not null`
# **`updated_at`**  | `datetime`         | `not null`
# **`day`**         | `date`             | `not null`
#
# ### Indexes
#
# * `index_activities_on_day` (_unique_):
#     * **`day`**
#

class Activity < ApplicationRecord
  has_many :activity_comments

  def comments
    @comments ||= activity_comments.includes(:game, :user).order(id: :asc).all
  end
end
