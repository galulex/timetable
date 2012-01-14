class Admin::UsersController < ApplicationController

  def index

  end

  def new

  end

  def create
    client = FacebookOAuth::Client.new(
      :application_id => '273919792672642',
      :application_secret => '73278582e486a6c2358b451128f2b385',
      :callback => 'http://example.com/facebook/callback'
    )
  end

end
