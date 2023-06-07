# frozen_string_literal: true

RSpec.describe 'Cities API', type: :request do
  describe 'Serializing responses' do
    let!(:cities) { create_list(:city, 5) }

    context '#index' do
      before { get api_cities_url }

      it 'returns index view' do
        expect(response).to have_http_status(:ok)
        expect(symbol_response.keys).to \
          eq([:cities])
        expect(symbol_response_root(:cities).first.keys).to \
          eq(%w[name slug])
        expect(symbol_response_root(:cities).count).to \
          eq(5)
        expect(symbol_response_root(:cities)[0].symbolize_keys).to \
          eq({ name: cities.first.name, slug: cities.first.slug })
      end
    end

    context '#show' do
      before { get api_city_url(cities.first.state.slug) }

      it 'returns show view' do
        expect(response).to have_http_status(:ok)
        expect(symbol_response.keys).to \
          eq([:cities])
        expect(symbol_response_root(:cities).first.keys).to \
          eq(%w[name slug state_id])
        expect(symbol_response_root(:cities).count).to \
          eq(1)
        expect(symbol_response_root(:cities)[0].symbolize_keys).to \
          eq({ name: cities.first.name, slug: cities.first.slug, state_id: cities.first.state_id })
      end
    end
  end

  describe 'Requests using filter params' do
    let(:city_amount) { rand(1..10) }
    let(:state) { create(:state) }
    let!(:cities) { create_list(:city, city_amount, state: state) }

    let(:q) do
      { q: { name_eq: cities.first.name } }
    end

    context 'index' do
      before do
        create_list(:city, city_amount)
        get api_cities_url, params: q
      end

      it 'requests index with filter params' do
        expect(response).to have_http_status(:ok)
        expect(symbol_response.keys).to \
          eq([:cities])
        expect(symbol_response_root(:cities).first.keys).to \
          eq(%w[name slug])
        expect(symbol_response_root(:cities).count).to \
          eq(1)
        expect(symbol_response_root(:cities)[0].symbolize_keys).to \
          eq({ name: cities[0].name, slug: cities[0].slug })
      end
    end

    context 'show' do
      before do
        create_list(:city, city_amount)
        get api_city_url(state.slug), params: q
      end

      it 'requests with filter params' do
        expect(response).to have_http_status(:ok)
        expect(symbol_response.keys).to \
          eq([:cities])
        expect(symbol_response_root(:cities).first.keys).to \
          eq(%w[name slug state_id])
        expect(symbol_response_root(:cities)[0].symbolize_keys).to \
          eq({ name: cities[0].name, slug: cities[0].slug,
               state_id: cities[0].state.id })
      end
    end
  end
end
