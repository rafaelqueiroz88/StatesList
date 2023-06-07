# frozen_string_literal: true

p 'Starting seed process'

states = ['Paraná', 'Santa Catarina', 'Rio Grande do Sul']

cities = [['Ponta Grossa', 'Maringá', 'Araucária'],
          ['Blumenau', 'Balneário Camboriú', 'Jaraguá do Sul'],
          ['Bento Gonçalves', 'Cambará do Sul', 'Gramado']]

states.each_with_index do |s, index|
  state = State.new(name: s, slug: s.parameterize)
  state.save
  cities[index].each do |city|
    City.create(name: city, slug: city.parameterize, state: state)
  end
end

p 'Seed process finish with 0 code'
