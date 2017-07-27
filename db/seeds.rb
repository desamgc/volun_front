require 'database_cleaner'

DatabaseCleaner.clean_with :truncation
Faker::Config.locale = I18n.locale

ACTIVITIES_NUM    = 10
ADDRESSES_NUM     = 20
PROJECTS_NUM      = 10
PROJECTS_NUM_FEATURED = 3
PROJECTS_NUM_OUTSTANDING = 1
REQUEST_FORMS_NUM = 10
DISTRICTS_NUM     = 10
ENTITIES_NUM      = 10
COORDINATIONS_NUM = 10
PROPOSAL_NUM      = 10
ENTITY_NUM        = 10
RACKING_NUM       = 10
ISSUE_NUM         = 10
TIMETABLE_NUM     = 5
EVENTS_NUM        = 5
DOCUMENT_NUM      = 5
SKILLS_NUM        = 5
LINKS_NUM      = 4

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
  10 => 'rt_activity_publishing',
  11 => 'rt_activity_unpublishing',
  12 => 'rt_other'
}

PROJECT_TYPES = {
  1 => 'pt_social',
  2 =>  'pt_centre',
  3 =>  'pt_permanent',
  4 =>  'pt_punctual',
  5 =>  'pt_entity',
  6 =>  'pt_subvention',
  7 =>  'pt_other'

}

REQUEST_REASONS = {
  0 => 'Publicar proyectos',
  1 => 'Demandar voluntarios',
  2 => 'Difundir actividad en agenda',
  3 => 'Otros'
}

LINK_TYPES = {
  1 => 'logo',
  2 => 'image',
  3 => 'url',
  4 => 'video',
  5 => 'document'
}

REQUEST_STATUS = {
  1 => 'Pending'

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

PROPOSALS = %w(subvencionado desistido desestimado excluido)

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


AREAS = {
  1 => 'EDUCACION',
  2 => 'CULTURA',
  3 => 'EMPLEO',
  4 => 'OTRA'
}


puts "Creando Links"
LINK_TYPES.each do |kind , name|
  LinkType.create!(kind: kind, description: name)
end


puts "Creando Areas"
AREAS.each do |kind , name|
  Area.create!(name: name, description: name, active: true)
end


puts "Creando Tipos de solicitudes"
REQUEST_TYPES.each do |kind , name|
  RequestType.create!(kind: kind, description: name)
end

puts "Creando Tipos de entidades"
ENTITY_TYPES.each do |kind , name|
  EntityType.create!(name: name, description: name)
end

puts "Creando Tipos de proyectos"
PROJECT_TYPES.each do |kind_num , kind_name|
  ProjectType.create!(id: kind_num, kind: kind_num, description: kind_name)
end





puts "Creando Tipos de razones"
REQUEST_REASONS.each do |code, name|
  ReqReason.create!(name: name, description: name)
end


puts "Creando Tipos de status"
REQUEST_STATUS.each do |code, name|
  ReqStatus.create!(kind: code, description: name)
end


REJECTION_TYPES = {
  1 => 'No procede',

}

puts "Creando Tipos de rechazos"
REJECTION_TYPES.each do |code, name|
  ReqRejectionType.create!(description: name, name: name)
end




























