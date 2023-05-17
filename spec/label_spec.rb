require 'rspec'
require_relative '../classes/label'

describe Label do
  describe '#intialize' do
    context 'add a label' do
      label = Label.new('My label', 'Red')
      it 'displays the label' do
        expect(label.title).to eq 'My label'
        expect(label.color).to eq 'Red'
      end
    end
  end
end
