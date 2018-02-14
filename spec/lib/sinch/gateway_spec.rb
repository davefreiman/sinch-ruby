require 'spec_helper'

module Sinch
  describe Gateway do
    before do
      Sinch.config.application_key = 'AREDACTEDKEY'
    end

    after { Sinch.config.application_key = nil }

    describe '.request' do
      context 'for a Start Verification Request' do
        let(:endpoint) { :verification }
        let(:params) { { phone_number: '+14165553555' } }

        it 'calls #do_request on the gateway' do
          expect_any_instance_of(described_class).to receive(:do_request)
          described_class.request endpoint, params
        end

        it 'returns an instance of Sinch::Response::Verification' do
          VCR.use_cassette('sinch/verification') do
            expect(described_class.request(endpoint, params).class).to eq Sinch::Response::Verification
          end

        end
        it 'is successful' do
          VCR.use_cassette('sinch/verification') do
            expect(described_class.request(endpoint, params).success?).to be true
          end
        end

      end

      context 'for a Report Verification Request' do
        let(:endpoint) { :report_verification }
        let(:params) { { phone_number: '+14165553555', code: '2782' } }

        it 'calls #do_request on the gateway' do
          expect_any_instance_of(described_class).to receive(:do_request)
          described_class.request endpoint, params
        end

        it 'returns an instance of Sinch::Response::ReportVerification' do
          VCR.use_cassette('sinch/report_verification') do
            expect(described_class.request(endpoint, params).class).to eq Sinch::Response::ReportVerification
          end
        end

        it 'is successful' do
          VCR.use_cassette('sinch/report_verification') do
            expect(described_class.request(endpoint, params).success?).to be true
          end
        end
      end
    end
  end
end
