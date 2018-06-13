require 'spec_helper'

module Sinch
  module Request
    describe SendSms do
      before do
        Sinch.config.application_key = 'AREDACTEDKEY'
        Sinch.config.secret_key = 'AREDACTEDSECRET'
      end

      subject { described_class.new params }
      let(:params) do
        {
          phone_number: '+14165553555',
          message: 'I have a very specific set of skills'
        }
      end

      describe '#method' do
        it 'is a post' do
          expect(subject.method).to eq :post
        end
      end

      describe '#endpoint' do
        it 'is the sms endpoint' do
          expect(subject.endpoint).to eq '/v1/Sms/+14165553555'
        end
      end

      describe '#payload' do
        it 'calls build on the builder' do
          expect_any_instance_of(Sinch::Builder::Request::SendSms).to receive(:build)
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
