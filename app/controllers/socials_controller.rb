class SocialsController < ApplicationController
  def index
    render json: {
      twitter: twitter_tweets,
      facebook: facebook_statuses,
      instagram: instagram_photos
    }
  end

private

  def instagram_photos
    Parser::Socials::Instagram.new.photos
  end

  def twitter_tweets
    Parser::Socials::Twitter.new.tweets
  end

  def facebook_statuses
    Parser::Socials::Facebook.new.statuses
  end
end
