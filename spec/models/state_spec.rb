# frozen_string_literal: true

RSpec.describe State, type: :model do
  describe 'Create new City' do
    context '.slugify' do
      let(:state) { described_class.create(name: 'Rio Grande do Sul') }

      it 'parameterizes name into a slug' do
        expect(state.slug).to eq('Rio Grande do Sul'.parameterize)
      end
    end
  end
end
