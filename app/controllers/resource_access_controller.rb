class ResourceAccessController < ApplicationController
  before_filter :require_user
  before_filter :require_owner, :only => [:edit, :update, :show, :destroy]
  before_filter :require_admin_to_see_others, :only => [:index]
end