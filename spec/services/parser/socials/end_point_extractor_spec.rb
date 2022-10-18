require 'rails_helper'

RSpec.describe Parser::Socials::EndPointExtractor do
  subject(:end_point_extractor) { Parser::Socials::EndPointExtractor.new(url:) }
  let(:url) { 'abc.com/123' }
  let(:response_code) { 200 }
  let(:response_body) { '[{"username":"@foo","tweet":"Hello!!"},{"username":"@bar","tweet":"World!!"}]' }
  let(:response) { double(code: response_code, body: response_body) }

  before do
    allow(Net::HTTP).to receive(:get_response).and_return(response)
  end

  describe '#json' do
    subject(:json) { end_point_extractor.json }
    let(:expected_json) do
      [
        { 'username' => '@foo', 'tweet' => 'Hello!!' },
        { 'username' => '@bar', 'tweet' => 'World!!' }
      ]
    end

    it 'returns parsed json of response' do
      expect(json).to eq(expected_json)
    end

    context 'when response body is not a valid json string' do
      let(:response_body) { 'Hello, how are you?' }

      it 'does not raise error' do
        expect(json).to eq([])
      end
    end
  end
end
