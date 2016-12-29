# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

PROJECTS_NUM      = 15
DISTRICTS_NUM     = 10
ACTIVITIES_NUM    = 10
ENTITIES_NUM      = 10
COORDINATIONS_NUM = 10
ADDRESSES_NUM     = 20
PROPOSAL_NUM      = 10
ENTITY_NUM        = 10
RACKING_NUM       = 10
ISSUE_NUM         = 10
TIMETABLE_NUM     = 15
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

REQUEST_TYPES = {
  0 => 'Alta voluntario',
  1 => 'Alta entidad',
  2 => 'Modificación datos voluntario',
  3 => 'Baja plataforma',
  4 => 'Solicitud de cita',
  5 => 'Demanda de voluntarios',
  6 => 'Publicar proyecto',
  7 => 'Publicar actividad',
  8 => 'Otras solicitudes'


}

REJECTION_TYPES = {
  0 => 'Sin estado'
  
}

ENTITY_TYPES = {
  0 => 'Universidad',
  1 => 'ONG'
  
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

PROVINCES = {

  '1'  => 'ARABA-ALAVA',
  '2'  => 'ALBACETE',
  '3'  => 'ALICANTE-ALACANT',
  '4'  => 'ALMERIA',
  '5'  => 'AVILA',
  '6'  => 'BADAJOZ',
  '7'  => 'ILLES BALEARS',
  '8'  => 'BARCELONA',
  '9'  => 'BURGOS',
  '10' => 'CACERES',
  '11' => 'CADIZ',
  '12' => 'CASTELLON-CASTELLO',
  '13' => 'CIUDAD REAL',
  '14' => 'CORDOBA',
  '15' => 'A CORUÑA',
  '16' => 'CUENCA',
  '17' => 'GIRONA',
  '18' => 'GRANADA',
  '19' => 'GUADALAJARA',
  '20' => 'GIPUZKOA',
  '21' => 'HUELVA',
  '22' => 'HUESCA',
  '23' => 'JAEN',
  '24' => 'LEON',
  '25' => 'LLEIDA',
  '26' => 'LA RIOJA',
  '27' => 'LUGO',
  '28' => 'MADRID',
  '29' => 'MALAGA',
  '30' => 'MURCIA',
  '31' => 'NAVARRA',
  '32' => 'OURENSE',
  '33' => 'ASTURIAS',
  '34' => 'PALENCIA',
  '35' => 'LAS PALMAS',
  '36' => 'PONTEVEDRA',
  '37' => 'SALAMANCA',
  '38' => 'SANTA CRUZ DE TENERIFE',
  '39' => 'CANTABRIA',
  '40' => 'SEGOVIA',
  '41' => 'SEVILLA',
  '42' => 'SORIA',
  '43' => 'TARRAGONA',
  '44' => 'TERUEL',
  '45' => 'TOLEDO',
  '46' => 'VALENCIA',
  '47' => 'VALLADOLID',
  '48' => 'BIZKAIA',
  '49' => 'ZAMORA',
  '50' => 'ZARAGOZA',
  '51' => 'CEUTA',
  '52' => 'MELILLA'

}

ROAD_TYPES = {
    'ACCESO'     => '13',
    'ARROYO'     => '1',
    'AUTOPISTA'  => '10',
    'AUTOVIA'    => '364',
    'AVENIDA'    => '13063',
    'BULEVAR'    => '199',
    'CALLE'      => '176374',
    'CALLEJON'   => '159',
    'CAMINO'     => '1604',
    'CAMINOALTO' => '28',
    'CARRERA'    => '50',
    'CARRETERA'  => '831',
    'CAÑADA'     => '107',
    'COLONIA'    => '364',
    'COSTANILLA' => '107',
    'CUESTA'     => '113',
    'GALERIA'    => '10',
    'GLORIETA'   => '288',
    'PARQUE'     => '30',
    'PARTICULAR' => '21',
    'PASADIZO'   => '6',
    'PASAJE'     => '',
    'PASEO'      => '4239',
    'PISTA'      => '4',
    'PLAZA'      => '3478',
    'PLAZUELA'   => '16',
    'PUENTE'     => '1',
    'RONDA'      => '',
    'TRAVESIA'   => '1007',
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

puts "Creando Tipos de rechazo"
REJECTION_TYPES.each do |kind , name|
  RejectionType.create!(kind: kind, description: name)
end

puts "Creando Tipos de request"
REQUEST_TYPES.each do |kind , name|
  RequestType.create!(kind: kind, description: name)
end

puts "Creando Tipos de entidades"
ENTITY_TYPES.each do |kind , name|
  EntityType.create!(kind: kind, description: name)
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


puts "Creando Provincias"
PROVINCES.each do |code, name|
  Province.create!(code: code, name: name)
end

puts "Creando Tipos de vías"
ROAD_TYPES.each do |name, code|
  RoadType.create!(name: name, code: code)
end


puts "Creando Tipos solicitudes"
REQUEST_REASONS.each do |code, name|
  RequestReason.create!(description: name)
end




puts "Creando Direcciones"
(1..ADDRESSES_NUM).each do |n|
  Address.create!(
    postal_code:           Faker::Address.postcode,
    road_type:             RoadType.all.sample,
    road_name:             Faker::Address.street_name,
    road_number_type:      Address::ROAD_NUMBER_TYPES.sample,
    road_number:           rand(100).to_s,
    grader:                Address::GRADERS.sample,
    stairs:                rand(300).to_s,
    floor:                 rand(9).to_s,
    door:                  rand(10).to_s,
    province:              Province.all.sample,
    country:               "España",
    town:                  "Madrid"
  )
end

puts "Creando Horarios"
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

(1..PROJECTS_NUM).each do |n|
    project   = Project.new()
    project.attributes = {
      name:                  "#{Faker::App.name} ",
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
    
    project.save!

    project.districts << District.find(n)
    project.addresses << Address.find(n)
    project.timetables << Timetable.find(n)


end

    #puts "Creating entidades"
    #Entity.create(name: 'Ayuntamiento de Madrid', id_tipoente: '1', id_tipo_via: '1', vial:'Maria Molina', planta:'Baja', telefono: '915133368', email: 'ayuntamiento@madrid.es', estado: 'A'   )
    #Entity.create(name: 'IAM', id_tipoente: '1', id_tipo_via: '1', vial:'Maria Molina', planta:'Baja', telefono: '915133368', email: 'iam@madrid.es', estado: 'A'   )
    #Entity.create(name: 'Universidad Carlos III', id_tipoente: '3', id_tipo_via: '1', vial:'Lezo', planta:'Baja', telefono: '915133368', email: 'universidad@madrid.es', estado: 'A'   )
    #Entity.create(name: 'Fundación Real Madrid', id_tipoente: '4', id_tipo_via: '1', vial:'Lezo', planta:'Baja', telefono: '915133368', email: 'empresa@madrid.es', estado: 'A'   )

    puts "Creating voluntarios"
    Volunteer.create(name: 'Jose Luis', first_surname:'Perez'   ,   second_surname:'Lopez', address: Address.all.sample, phone_number: 'xxxxx', email: 'perezljl@madrid.es')
    Volunteer.create(name: 'Angel',     first_surname:'Guiñales'   ,second_surname:'del Valle', address: Address.all.sample, phone_number: 'xxxxx', email: 'perezljl@madrid.es')
    Volunteer.create(name: 'Alberto',   first_surname:'Delgado'   , second_surname:'Rico', address: Address.all.sample, phone_number: 'xxxxx', email: 'perezljl@madrid.es')


    puts "Creating usuarios"
    pwd = '12345678'
    User.create( email: 'voluntario@madrid.es', password: pwd, password_confirmation: pwd, profileable_id: '1', profileable_type: "Volunteer")
    User.create( email: 'entidad@madrid.es', password: pwd, password_confirmation: pwd, profileable_id: '1', profileable_type: "Entity")
    
  

