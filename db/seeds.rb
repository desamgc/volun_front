require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

ADDRESSES_NUM     = 20
PROJECTS_NUM      = 10
REQUEST_FORMS_NUM = 10
DISTRICTS_NUM     = 10
ENTITIES_NUM      = 10
COORDINATIONS_NUM = 10
PROPOSAL_NUM      = 10
ENTITY_NUM        = 10
RACKING_NUM       = 10
ISSUE_NUM         = 10
ACTIVITIES_NUM    = 5
TIMETABLE_NUM     = 5
EVENTS_NUM        = 5
DOCUMENT_NUM      = 5
SKILLS_NUM        = 5

REQUEST_TYPES = {
  1  => 'rt_volunteer_subscribe',
  2  => 'rt_volunteer_unsubscribe',
  3  => 'rt_volunteer_amendment',
  4  => 'rt_volunteer_appointment',
  5  => 'rt_entity_subscribe',
  6  => 'rt_entity_unsubscribe',
  7  => 'rt_volunteers_demand',
  8  => 'rt_project_publishing',
  9  => 'rt_project_unpublishing',
  10 => 'rt_project_unsubscribe',
  11 => 'rt_activity_publishing',
  12 => 'rt_activity_unpublishing',
  13 => 'rt_other'
}

PROJECT_TYPES = {
  1 => 'Servicios Sociales',
  2 => 'Centros de mayores',
  3 => 'Permanentes',
  4 => 'Puntuales',
  5 => 'Entidades',
  6 => 'Subvencionados',
  7 => 'Otros'
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
    'COLONIA'    => '364 ',
    'COSTANILLA' => '107 ',
    'CUESTA'     => '113',
    'GALERIA'    => '10 ',
    'GLORIETA'   => '288',
    'PARQUE'     => '30',
    'PARTICULAR' => '21',
    'PASADIZO'   => '6',
    'PASAJE'     => '',
    'PASEO'      => '4239',
    'PISTA'      => '4',
    'PLAZA'      => '3478',
    'PLAZUELA'   => '16',
    'PUENTE'     => '1 ',
    'RONDA'      => ' ',
    'TRAVESIA'   => '1007',
}


ENTITY_TYPES = {
  0 => 'Organización',
  1 => 'Empresa',
  2 => 'Asociación'
}

NOTICE_TYPES = {
  0 => 'email',
  1 => 'sms',
  2 => 'papel'
}


puts "Creando Medios de comunicación"
NOTICE_TYPES.each do |kind , name|
  NoticeType.create!(kind: kind, description: name)
end



puts "Creando Tipos de solicitudes"
REQUEST_TYPES.each do |kind , name|
  RequestType.create!(kind: kind)
end

puts "Creando Tipos de entidades"
ENTITY_TYPES.each do |kind , name|
  EntityType.create!(kind: kind, description: name)
end

puts "Creando Tipos de proyectos"
PROJECT_TYPES.each do |kind , name|
  ProjectType.create!(kind: kind, description: name)
end

puts "Creando Coordinaciones"
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




  

