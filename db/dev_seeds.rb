require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

PROJECTS_NUM      = 10
DISTRICTS_NUM     = 10
ACTIVITIES_NUM    = 10
ENTITIES_NUM      = 10
COORDINATIONS_NUM = 10
ADDRESSES_NUM     = 20
PROPOSAL_NUM      = 10
ENTITY_NUM        = 10
RACKING_NUM       = 10
ISSUE_NUM         = 10
TIMETABLE_NUM     = 10
DOCUMENT_NUM      = 10

PROJECT_TYPES = {
  0 => 'Servicios Sociales',
  1 => 'Centros de mayores',
  2 => 'Permanentes',
  3 => 'Puntuales',
  4 => 'Entidades',
  5 => 'Subvencionados',
  6 => 'Otros'
}

REQUEST_REASONS = {
  0 => 'Difusión de proyectos',
  1 => 'Solicitud voluntarios',
  2 => 'Publicación actividad en agenda',
  3 => 'Otros'
}

AREA_NAMES = [
  'Derechos Sociales',
  'Ambiental',
  'Cultural',
  'Deportivo',
  'Educativo',
  'Socio-sanitario',
  'Ocio y tiempo libre',
  'Comunitario y/o de ciudad',
  'Animales',
  'Participación',
  'On line',
  'Cuidados a las personas',
  'Sensibilización',
  'Comunicación',
  'Cooperación',
  'Responsabilidad social',
  'Emergencias',
  'Otros'
]

COLLECTIVE_NAMES = [
  'Menores',
  'Jóvenes',
  'Mayores',
  'Diversidad funcional',
  'Mujer',
  'Inmigrantes',
  'Refugiados',
  'Personas sin hogar',
  'Reclusos y exreclusos',
  'Personas enfermas',
  'Exclusión social',
  'Voluntariado',
  'Toda la población',
  'Otros'
]

DISTRICTS = {

  '01' => 'CENTRO',
  '02' => 'ARGANZUELA',
  '03' => 'RETIRO',
  '04' => 'SALAMANCA',
  '05' => 'CHAMARTIN',
  '06' => 'TETUAN',
  '07' => 'CHAMBERI',
  '08' => 'FUENCARRAL-EL PARDO',
  '09' => 'MONCLOA-ARAVACA',
  '10' => 'LATINA',
  '11' => 'CARABANCHEL',
  '12' => 'USERA',
  '13' => 'PUENTE VALLECAS',
  '14' => 'MORATALAZ',
  '15' => 'CIUDAD LINEAL',
  '16' => 'HORTALEZA',
  '17' => 'VILLAVERDE',
  '18' => 'VILLA DE VALLECAS',
  '19' => 'VICÁLAVARO',
  '20' => 'SAN BLAS',
  '21' => 'BARAJAS',
  '22' => 'OTRO MUNICIPIO',
  '99' => 'OTROS'

}

PROPOSALS = %w(subvencionado desistido desestimado excluido)

puts "Creando usuario administrador..."
User.first_or_initialize(email: 'admin@madrid.es',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1').save!

puts "Creando Colectivos"
AREA_NAMES.each do |name|
  Area.create!(name: name)
end

puts "Creando Ámbitos"
COLLECTIVE_NAMES.each do |name|
  Collective.create!(name: name)
end

puts "Creando Propuestas"
PROPOSALS.each do |name|
  Proposal.create!(name: name)
end

puts "Creando Tipos de proyectos"
PROJECT_TYPES.each do |kind , name|
  ProjectType.create!(kind: kind)
end

puts "Creando entidades"
(1..ENTITIES_NUM).each do |n|
  Entity.create!(name: "#{Entity.model_name.human} #{n}")
end

puts "Creando coordinaciones"
(1..COORDINATIONS_NUM).each do |n|
  Coordination.create!(name: "#{Coordination.model_name.human} #{n}")
end

puts "Creando Distritos"
DISTRICTS.each do |code, name|
  District.create!(code: code, name: name)
end

puts "Creando Direcciones"
(1..ADDRESSES_NUM).each do |n|
  Address.create!(
      postal_code:           Faker::Address.postcode,
      road_type:             ['Calle', 'Plaza', 'Av.'].sample,
      road_name:             Faker::Address.street_name,
      road_number_type:           nil,
      road_number:           rand(100).to_s,
      grader:                nil,
      stairs:                rand(300).to_s,
      floor:                 rand(9).to_s,
      door:                  rand(10).to_s
  )
end

puts "Creando Forarios"
(1..TIMETABLE_NUM).each do |n|
  Timetable.create!(
      day:        Timetable.days.values.sample,
      start_hour: '11:11',
      end_hour:   '12:12'
  )
end

# puts "Creando Motivos de solicitud"
# REQUEST_REASONS.each do |kind , name|
#   RequestReason.create!(kind: kind)
# end

puts "Creando Proyectos"
PROJECT_TYPE_MODELS = [
  PtSubvention,
  PtEntity,
  PtPunctual,
  PtPermanent,
  PtCentre,
  PtSocial,
  PtOther
]
PROJECT_TYPE_MODELS.each do |pt_model|
  (1..PROJECTS_NUM).each do |n|
    pt_record = pt_model.new
    project   = pt_record.project
    project.attributes = {
      name:                  "#{Faker::App.name} #{pt_model.model_name.human} #{n}",
      description:           Faker::Lorem.sentence,
      functions:             Faker::Lorem.sentence,
      comments:              Faker::Lorem.sentence,
      entity_id:             Entity.all.sample.id,
      execution_start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
      execution_end_date:    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow),
      contact_name:          Faker::Name.name,
      phone_number:          Faker::PhoneNumber.phone_number,
      email:                 Faker::Internet.email,
      beneficiaries_num:     10,
      volunteers_num:        rand(100),
    }

    [Address, Area, Collective, Coordination, District, Timetable].each do |model|
      model.first(5).each do |record|
        unless project.public_send("#{model.model_name.singular}_ids").include? record.id
          project.public_send(model.model_name.plural) << record
        end
      end
    end

    pt_record.save!
  end
end
