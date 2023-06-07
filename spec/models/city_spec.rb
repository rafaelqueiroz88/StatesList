# frozen_string_literal: true

RSpec.describe City, type: :model do
  describe 'Create new City' do
    context '.slugify' do
      let(:city) { described_class.create(name: 'Jaraguá do Sul') }

      it 'parameterizes name into a slug' do
        expect(city.slug).to eq('Jaraguá do Sul'.parameterize)
      end
    end
  end
end
