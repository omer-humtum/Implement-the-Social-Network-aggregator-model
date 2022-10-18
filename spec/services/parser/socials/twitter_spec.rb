require 'rails_helper'

RSpec.describe Parser::Socials::Twitter do
  subject(:twitter_parser) { Parser::Socials::Twitter.new }

  let(:twitter_json) do
    [
      { 'username' => '@foo', 'tweet' => 'Hello!!' },
      { 'username' => '@bar', 'tweet' => 'World!!' }
    ]
  end

  before do
    allow_any_instance_of(Parser::Socials::EndPointExtractor).to receive(:json).and_return(twitter_json)
  end

  describe '#tweets' do
    subject(:tweets) { twitter_parser.tweets }
    it 'returns all the tweets' do
      expect(tweets).to eq(['Hello!!', 'World!!'])
    end
  end
end
