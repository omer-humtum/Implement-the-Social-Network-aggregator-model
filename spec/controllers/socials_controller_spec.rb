require 'rails_helper'

RSpec.describe SocialsController, type: :controller do
  let(:statuses) { %w[foo bar] }
  let(:photos) { %w[cat dog] }
  let(:tweets) { %w[hello world] }

  let(:rendered_result) do
    {
      'facebook' => %w[foo bar],
      'instagram' => %w[cat dog],
      'twitter' => %w[hello world]
    }
  end

  before do
    allow_any_instance_of(SocialsController).to receive(:facebook_statuses).and_return(statuses)
    allow_any_instance_of(SocialsController).to receive(:twitter_tweets).and_return(tweets)
    allow_any_instance_of(SocialsController).to receive(:instagram_photos).and_return(photos)
  end
  describe '#index' do
    it 'renders the update for all the socials' do
      get :index
      expect(JSON.parse(response.body)).to eq(rendered_result)
    end
  end
end
