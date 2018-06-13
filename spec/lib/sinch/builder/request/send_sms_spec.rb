require 'spec_helper'

module Sinch
  module Builder
    module Request
      describe SendSms do
        subject { described_class.new params }
        let(:params) do
          {
            message: 'Extremely Obi-Wan voice: "Hello There"',
            from: '+14165553555'
          }
        end
        let(:built) { subject.build }
        describe '#build' do
          it 'builds an identity' do
            expect(built[:message]).to eq 'Extremely Obi-Wan voice: "Hello There"'
            expect(built[:from]).to eq '+14165553555'
          end

        end
      end
    end
  end
end
