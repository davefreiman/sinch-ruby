require 'spec_helper'

module Sinch
  module Builder
    module Request
      describe ReportVerification do
        subject { described_class.new params }
        let(:params) do
          {
            code: 'somecode'
          }
        end
        let(:built) { subject.build }
        describe '#build' do
          it 'builds an sms code' do
            expect(built[:sms][:code]).to eq 'somecode'
          end

          it 'specifies sms as method' do
            expect(built[:method]).to eq 'sms'
          end
        end
      end
    end
  end
end
