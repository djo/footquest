class BaseSecureController < ApplicationController
  # REST Controller
  inherit_resources
  # Enforce Resource Security using CanCan
  # this will also load the Inherited Resource
  load_and_authorize_resource
end
