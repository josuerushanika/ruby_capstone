require 'rspec'
require_relative '../classes/book'
require_relative '../classes/item'

describe Book do
  describe '#initialize' do
    context 'add a book' do
      book = Book.new('Publisher', 'good')
      it 'displays the publisher and the state' do
        expect(book.publisher).to eq 'Publisher'
        expect(book.cover_state).to eq 'good'
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
