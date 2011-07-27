class MapsController < BaseSecureController
  belongs_to :quest, :singleton => true
  actions :show, :update
end
