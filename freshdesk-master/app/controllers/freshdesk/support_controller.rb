 require 'openssl'
require_dependency "freshdesk/application_controller"

module Freshdesk
  class SupportController < ApplicationController
    before_action :authenticate_user!, only: [:freshdesk_sso_url]

    def freshdesk
      redirect_to 'https://clearfundssupport.freshdesk.com/support/home'
    end

    def freshdesk_sso_url
      utctime = time_in_utc
      redirect_to Rails.application.secrets[:freshdesk_domain_name] + "login/sso?"\
      "name=#{current_user.name}"\
      "&email=#{current_user.email}"\
      "&timestamp=#{utctime}"\
      "&hash=#{gen_hash_from_params_hash(utctime)}"
    end
    
    private

    def gen_hash_from_params_hash(utctime)
      digest  = OpenSSL::Digest::Digest.new('MD5')
      OpenSSL::HMAC.hexdigest(digest,Rails.application.secrets[:freshdesk_sso_decret],current_user.name+Rails.application.secrets[:freshdesk_sso_decret]+current_user.email+utctime)
    end

    def time_in_utc
      Time.now.getutc.to_i.to_s
    end

  end
end

