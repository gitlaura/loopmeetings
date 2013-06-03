class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def collect_marketing_referrer
    unless session[:marketing_referrer_id] or params[:marketing_campaign_slug].blank?
      marketing_campaign = MarketingCampaign.where(slug: params[:marketing_campaign_slug]).first rescue nil
      marketing_campaign.increment_visits unless marketing_campaign.nil?
      session[:marketing_referrer_id] = marketing_campaign.id unless marketing_campaign.nil?
    end

    unless session[:ppc_referral_token] or params[:ppc_referral_token].blank?
      session[:ppc_referral_token] = params[:ppc_referral_token]
    end


  end

end
