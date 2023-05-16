require 'rspec'
require_relative '../classes/book'
require_relative '../classes/item'


RSpec.describe Book do
  describe '#can_be_archived?' do
    context 'when cover_state is good' do
      it 'returns true' do
        book = Book.new('Publisher', 'good')
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when cover_state is bad' do
      it 'returns true' do
        book = Book.new('Publisher', 'bad')
        expect(book.can_be_archived?).to eq(true)
      end
    end

    context 'when cover_state is neither good nor bad' do
      it 'returns false' do
        book = Book.new('Publisher', 'average')
        expect(book.can_be_archived?).to eq(false)
      end
    end
  end
end
