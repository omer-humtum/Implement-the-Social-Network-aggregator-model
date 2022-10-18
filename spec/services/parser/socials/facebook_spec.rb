require 'rails_helper'

RSpec.describe Parser::Socials::Facebook do
  subject(:facebook_parser) { Parser::Socials::Facebook.new }

  let(:facebook_json) do
    [
      { 'name' => 'Foo', 'status' => 'Hello!!' },
      { 'name' => 'Bar', 'status' => 'World!!' }
    ]
  end

  before do
    allow_any_instance_of(Parser::Socials::EndPointExtractor).to receive(:json).and_return(facebook_json)
  end

  describe '#statuses' do
    subject(:statuses) { facebook_parser.statuses }
    it 'returns the statuses of all the friends' do
      expect(statuses).to eq(['Hello!!', 'World!!'])
    end
  end
end
