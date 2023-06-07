# frozen_string_literal: true

RSpec.describe 'States API', type: :request do
  describe 'Serializing responses' do
    let!(:state) { create(:state) }

    context '#index' do
      before { get api_states_url }

      it 'returns index view' do
        expect(response).to have_http_status(:ok)
        expect(symbol_response.keys).to \
          eq([:states])
        expect(symbol_response_root(:states).first.keys).to \
          eq(%w[name slug])
        expect(symbol_response_root(:states).count).to \
          eq(1)
        expect(symbol_response_root(:states)[0].symbolize_keys).to \
          eq({ name: state.name, slug: state.slug })
      end
    end
  end

  describe 'Requests using filter params' do
    let(:state_amount) { rand(1..10) }
    let!(:state) { create(:state, name: 'Paraná') }
    let!(:states) { create_list(:state, state_amount) }

    let(:q) do
      { q: { name_eq: 'Paraná' } }
    end

    context 'index with filter params' do
      before { get api_states_url, params: q }

      it 'requests index with filter params' do
        expect(response).to have_http_status(:ok)
        expect(symbol_response.keys).to \
          eq([:states])
        expect(symbol_response_root(:states).first.keys).to \
          eq(%w[name slug])
        expect(symbol_response_root(:states).count).to \
          eq(1)
        expect(symbol_response_root(:states)[0].symbolize_keys).to \
          eq({ name: 'Paraná', slug: 'Paraná'.parameterize })
      end
    end
  end

  describe 'Requests without filter params' do
    let(:state_amount) { rand(1..10) }
    let!(:states) { create_list(:state, state_amount) }

    context 'index without filter params' do
      before { get api_states_url }

      it 'requests index with filter params' do
        expect(response).to have_http_status(:ok)
        expect(symbol_response.keys).to \
          eq([:states])
        expect(symbol_response_root(:states).first.keys).to \
          eq(%w[name slug])
        expect(symbol_response_root(:states).count).to \
          eq(state_amount)
        expect(symbol_response_root(:states)[0].symbolize_keys).to \
          eq({ name: states[0].name, slug: states[0].slug })
      end
    end
  end
end
