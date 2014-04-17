class HomeController < ApplicationController
  before_filter :collect_marketing_referrer, :only => :marketing

  def index
  end

  def faqs
  end

  def membership
  end

  def partnerships
  end

  def lightbox
  end

  def cancel
  end

  def ideas
  end

  def events
  end

  def about
  end

  def jobs
  end

  def meetings
  end

  def apply
  end

  def manifesto
  end

  def membership
  end

  def change
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

  def monthly
  end

  def update
  end

  def annualmembership
  end

  def monthlymembership
  end

  def bios
  end

  def marketing
    redirect_to root_path
  end

  def landing_page
  end

end
