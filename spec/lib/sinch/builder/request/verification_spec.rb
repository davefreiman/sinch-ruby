require 'spec_helper'

module Sinch
  module Builder
    module Request
      describe Verification do
        subject { described_class.new params }
        let(:params) do
          {
            phone_number: '+14165553555'
          }
        end
        let(:built) { subject.build }
        describe '#build' do
          it 'builds an identity' do
            expect(built[:identity][:type]).to eq 'number'
            expect(built[:identity][:endpoint]).to eq '+14165553555'
          end

          it 'specifies sms as method' do
            expect(built[:method]).to eq 'sms'
          end
        end
      end
    end
  end
end
