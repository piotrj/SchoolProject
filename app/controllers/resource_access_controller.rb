class ResourceAccessController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :index]
  before_filter :require_owner, :only => [:edit, :update, :show]
end