class ResourceAccessController < ApplicationController
  before_filter :require_user, :only => [:new, :create]
  before_filter :require_owner, :only => [:edit, :update, :show, :index, :destroy]
end