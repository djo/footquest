require 'spec_helper'

describe UsersController do
  render_views

  should_deny_unauthenticated_users_to [:edit, :update], Factory(:user)
  should_allow_only_admins_to [:new, :create], Factory(:user)
end
