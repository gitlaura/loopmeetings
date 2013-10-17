class HomeController < ApplicationController
  before_filter :collect_marketing_referrer, :only => :marketing

  def index
  end

  def faqs
  end

  def events
  end

  def about
  end

  def meetings
  end

  def apply
  end

  def manifesto
  end

  def membership
  end

  def membersonly
  end

  def meetingone
  end

  def meetingtwo
  end

  def meetingthree
  end

  def meetingfour
  end

  def update
  end

  def upgrade
  end

  def bios
  end

  def marketing
    redirect_to root_path
  end

  def landing_page
  end

end
