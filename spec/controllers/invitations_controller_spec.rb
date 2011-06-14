require 'spec_helper'

describe InvitationsController do
  render_views
  should_allow_only_admins_to [:new, :create]
end
