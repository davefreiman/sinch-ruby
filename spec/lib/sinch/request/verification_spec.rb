require 'spec_helper'

module Sinch
  module Request
    describe Verification do
      subject { described_class.new params }
      let(:params) do
        {
          phone_number: '+14165553555'
        }
      end

      describe '#method' do
        it 'is a post' do
          expect(subject.method).to eq :post
        end
      end

      describe '#endpoint' do
        it 'is the verification endpoint' do
          expect(subject.endpoint).to eq '/verification/v1/verifications'
        end
      end

      describe '#payload' do
        it 'calls build on the builder' do
          expect_any_instance_of(Sinch::Builder::Request::Verification).to receive(:build)
          subject.payload
        end
      end

      describe '#headers' do
        it 'includes the content-type header' do
          expect(subject.headers['content-type']).to eq 'application/json'
        end

        it 'includes the authorization header' do
          expect(subject.headers['authorization']).to match(/Application\s.*/)
        end

        it 'includes the timestamp header' do
          expect(subject.headers['x-timestamp']).to eq Time.now.utc.iso8601
        end
      end
    end
  end
end
