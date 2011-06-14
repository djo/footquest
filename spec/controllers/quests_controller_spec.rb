require 'spec_helper'

describe QuestsController do
  render_views
  should_deny_unauthenticated_users_to [:new, :create, :edit, :update, :destroy], Factory(:quest)
end
