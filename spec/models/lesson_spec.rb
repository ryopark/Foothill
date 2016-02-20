require 'rails_helper'

RSpec.describe Lesson do
  subject(:lesson) { Lesson.new(name: 'physics', prof_name: 'michael', in_class: true, book_name: 'physic tutorial') }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:prof_name) }
  it { is_expected.to respond_to(:in_class) }
  it { is_expected.to respond_to(:book_name) }

  describe 'name' do
    context 'when it is nil' do
      before { lesson.name = nil }

      it 'has one error on name' do
        expect(lesson).not_to be_valid
        expect(lesson.errors[:name].size).to eq 1
      end
    end

    context 'when it is empty' do
      before { lesson.name = '' }

      it 'has one error on name' do
        expect(lesson).not_to be_valid
        expect(lesson.errors[:name].size).to eq 1
      end
    end
  end

  describe 'prof_name' do
    context 'when it is nil' do
      before { lesson.prof_name = nil }

      it 'has one error on prof_name' do
        expect(lesson).not_to be_valid
        expect(lesson.errors[:prof_name].size).to eq 1
      end
    end

    context 'when it is empty' do
      before { lesson.prof_name = '' }

      it 'has one error on prof_name' do
        expect(lesson).not_to be_valid
        expect(lesson.errors[:prof_name].size).to eq 1
      end
    end
  end
end
