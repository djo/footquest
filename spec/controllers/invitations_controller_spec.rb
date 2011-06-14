require 'spec_helper'

describe InvitationsController do

  should_allow_only_admins_to [:new, :create]

end
