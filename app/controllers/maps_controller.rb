class MapsController < InheritedResources::Base
  load_and_authorize_resource

  belongs_to :quest, :singleton => true
  actions :show, :update
end
