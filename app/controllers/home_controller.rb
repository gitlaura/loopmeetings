class HomeController < ApplicationController
  before_filter :collect_marketing_referrer, :only => :marketing

  def index
  end

  def learn_more
  end

  def marketing
    redirect_to root_path
  end
end
