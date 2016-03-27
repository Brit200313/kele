require 'spec_helper'

describe Kele, type: :request do
  context '.kele' do
    describe '#initialize' do

      it 'raises error' do
        expect { Kele.new(ENV['EMAIL'], "fakefake") }.to raise_error(InvalidStudentCodeError)
      end

      it 'authenticates user' do
        response = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
        expect(response.instance_variable_get(:@auth_token)).to be_a String
      end

    end

    describe '#get_me' do
      it 'returns an object' do
        response = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
        response = response.get_me
        expect(response.instance_variable_get(:@user_data)).to be_a Object
      end
    end

    describe '#get_mentor_availability' do
      it 'returns an object' do
        response = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
        #response = response.get_mentor_availability(ENV['MENTOR_ID'])
        #expect(response.instance_variable_get(:@mentor_availability)).to be_a Object
      end
    end

    describe '#get_roadmap' do
      it 'returns an object' do
        response = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
        response = response.get_roadmap(ENV['ROADMAP_ID'])
        expect(response.instance_variable_get(:@roadmap)).to be_a Object
      end
    end

    describe '#get_checkpoint' do
      it 'returns an object' do
        response = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
        response = response.get_checkpoint(ENV['CHECKPOINT_ID'])
        expect(response.instance_variable_get(:@checkpoint)).to be_a Object
      end
    end

    describe '#get_messages' do
      it 'returns an object' do
        response = Kele.new(ENV['EMAIL'], ENV['PASSWORD'])
        response = response.get_messages(ENV['PAGE_ID'])
        expect(response.instance_variable_get(:@get_messages)).to be_a Object
      end
    end
  end

end
