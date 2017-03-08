
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
ACTIVITIES_NUM    = 5
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
  1 => 'Servicios Sociales'
  
}

REQUEST_REASONS = {
  0 => 'Difusión de proyectos',
  1 => 'Solicitud voluntarios',
  2 => 'Publicación actividad en agenda',
  3 => 'Otros'
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
ProjectType.kinds.each do |kind_name , kind_num|
  ProjectType.create!(id: kind_num, kind: kind_num, description: kind_name)
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



puts "Creando Direcciones"
(1..ADDRESSES_NUM).each do |n|
  Address.create!(
    postal_code:           Faker::Address.postcode,
    road_type:             RoadType.all.sample.name,
    road_name:             Faker::Address.street_name,
    road_number_type:      Address::ROAD_NUMBER_TYPES.sample,
    road_number:           rand(100).to_s,
    grader:                Address::GRADERS.sample,
    stairs:                rand(300).to_s,
    floor:                 rand(9).to_s,
    door:                  rand(10).to_s,
    province:              Province.all.sample.name,
    country:               "España",
    town:                  "Madrid",
    latitude:              441900 + rand(100), 
    longitude:             4479566 + rand(100), 
    district:              District.all.sample.name,
    borough:               Faker::Address.state 
  )
end

puts "Creando entidades"
(1..ENTITIES_NUM).each do |n|
  entity = Entity.create!(
    name: "#{Entity.model_name.human} #{n}", 
    email:Faker::Internet.email, 
    representative_name:Faker::Lorem.name, 
    representative_last_name:Faker::Lorem.name, 
    contact_name:Faker::Lorem.name, 
    contact_last_name:Faker::Lorem.name,
    entity_type_id:EntityType.all.sample.id, 
    address_id:Address.all.sample.id  )

  puts "Creando links"
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 1,
        url: "assets/" + rand(1..16).to_s + ".jpg",
        linkable: entity
    )
  end
end  









# puts "Creando Motivos de solicitud"
# REQUEST_REASONS.each do |kind , name|
#   RequestReason.create!(kind: kind)
# end




# puts "Creando Motivos de solicitud"
# REQUEST_REASONS.each do |kind , name|
#   RequestReason.create!(kind: kind)
# end

puts "Creando Proyectos outstanding"
(1..PROJECTS_NUM_OUTSTANDING).each do |n|
    project_other = Pt::Other.new()
    project   = Project.new()
    project.attributes = {
      name:                  "#{Faker::App.name}  #{n}",
      description:           "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
      functions:             Faker::Lorem.sentence,
      comments:              Faker::Lorem.sentence,
      entity_id:             Entity.all.sample.id,
      execution_start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
      execution_end_date:    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow),
      phone_number:          Faker::PhoneNumber.phone_number,
      email:                 Faker::Internet.email,
      beneficiaries_num:     10,
      volunteers_num:        rand(100),
      project_type_id:       7,
      insured:               false,
      active:                true,
      publish:               true,
      outstanding:           true,  
      contact_name:          Faker::Lorem.name,   
      contact_last_name:     Faker::Lorem.name,
      pt_extendable:         project_other 

    }
    
    project.save!

    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.all.sample,
        eventable:  project,
      )

      puts "Creando Horarios para evento #{event.id}"
      2.times do
        Timetable.create!(
          event: event,
          execution_date:  rand(100).days.since.to_date,
          start_hour: '11:11',
          end_hour:   '12:12'
        )
      end
    end

    puts "Creando links"
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 1,
        url: "assets/" + rand(1..16).to_s + ".jpg",
        linkable: project
    )
    end  
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 2,
        url: "assets/#{n}.jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 3,
        url: "http://www.marca.com",
        linkable: project
    )  
    end  
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 4,
        url: "http://vjs.zencdn.net/v/oceans.mp4",
        linkable: project
    )  
    end    
    
end




puts "Creando Proyectos featured"
(1..PROJECTS_NUM_FEATURED).each do |n|
    project_other = Pt::Other.new()
    project   = Project.new()
    project.attributes = {
      name:                  "#{Faker::App.name}  #{n}",
      description:           "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
      functions:             Faker::Lorem.sentence,
      comments:              Faker::Lorem.sentence,
      entity_id:             Entity.all.sample.id,
      execution_start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
      execution_end_date:    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow),
      phone_number:          Faker::PhoneNumber.phone_number,
      email:                 Faker::Internet.email,
      beneficiaries_num:     10,
      volunteers_num:        rand(100),
      project_type_id:       7,
      insured:               true,
      active:                true,
      publish:               true,
      contact_name:          Faker::Lorem.name,   
      contact_last_name:     Faker::Lorem.name,
      pt_extendable:         project_other 

    }
    
    project.save!
    project.areas << Area.all.sample
    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.all.sample,
        eventable:  project,
      )

      puts "Creando Horarios para evento #{event.id}"
      2.times do
        Timetable.create!(
          event: event,
          execution_date:  rand(100).days.since.to_date,
          start_hour: '11:11',
          end_hour:   '12:12'
        )
      end
    end

    puts "Creando links"
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 1,
        url: "assets/" + rand(1..16).to_s + ".jpg",
        linkable: project
    )
    end  
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 2,
        url: "assets/#{n}.jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 3,
        url: "http://www.marca.com",
        linkable: project
    )  
    end  
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 4,
        url: "http://vjs.zencdn.net/v/oceans.mp4",
        linkable: project
    )  
    end    
    
end




puts "Creando Proyectos"
(1..PROJECTS_NUM).each do |n|
    project_other = Pt::Other.new()
    project   = Project.new()
    project.attributes = {
      name:                  "#{Faker::App.name}  #{n}",
      description:          "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
      functions:             Faker::Lorem.sentence,
      comments:              Faker::Lorem.sentence,
      entity_id:             Entity.all.sample.id,
      execution_start_date:  Faker::Time.between(DateTime.now - 10, DateTime.now),
      execution_end_date:    Faker::Time.between(DateTime.tomorrow - 10, DateTime.tomorrow),
      phone_number:          Faker::PhoneNumber.phone_number,
      email:                 Faker::Internet.email,
      beneficiaries_num:     10,
      volunteers_num:        rand(100),
      project_type_id:       7,
      insured:               false,
      active:                true,
      publish:               true,
      contact_name:           Faker::Lorem.name,   
      contact_last_name:           Faker::Lorem.name,
      pt_extendable:         project_other    
    }
    
    project.save!

    project.areas << Area.all.sample
    
    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.all.sample,
        eventable:  project,
      )

      puts "Creando Horarios para evento #{event.id}"
      2.times do
        Timetable.create!(
          event: event,
          execution_date:  rand(100).days.since.to_date,
          start_hour: '11:11',
          end_hour:   '12:12'
        )
      end
    end

    puts "Creando links"
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 1,
        url: "assets/" + rand(1..16).to_s  + ".jpg",
        linkable: project
    )
    end  
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 2,
        url: "assets/#{n}.jpg",
        linkable: project
    )
    end  
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 3,
        url: "http://www.marca.com",
        linkable: project
    )  
    end  
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 4,
        url: "http://vjs.zencdn.net/v/oceans.mp4",
        linkable: project
    )  
    end  
    
end





puts "Creando actividades"
(1..ACTIVITIES_NUM).each do |n|
    activity   = Activity.new()
    activity.attributes = {
      name:                  Faker::Lorem.name + "#{n}" ,
      description:           "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
      start_date:   Time.now,
      end_date:     Time.now,
      transport: Faker::Lorem.name,
      entity: Entity.all.sample
      
    }
    
    activity.save!

    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.all.sample,
        eventable:  activity,
      )

      puts "Creando Horarios para evento #{event.id}"
      2.times do
        Timetable.create!(
          event: event,
          execution_date:  rand(100).days.since.to_date,
          start_hour: '11:11',
          end_hour:   '12:12'
        )
      end
    end

    puts "Creando links"
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 1,
        url: "assets/" + rand(1..16).to_s  + ".jpg",
        linkable: activity
    )
    end  
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 2,
        url: "assets/#{n}.jpg",
        linkable: activity
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 3,
        url: "http://www.marca.com",
        linkable: activity
    )  
    end  
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        kind: 4,
        url: "http://vjs.zencdn.net/v/oceans.mp4",
        linkable: activity
    )  
    end    
    

end

    #puts "Creating entidades"
    #Entity.create(name: 'Ayuntamiento de Madrid', id_tipoente: '1', id_tipo_via: '1', vial:'Maria Molina', planta:'Baja', telefono: '915133368', email: 'ayuntamiento@madrid.es', estado: 'A'   )
    #Entity.create(name: 'IAM', id_tipoente: '1', id_tipo_via: '1', vial:'Maria Molina', planta:'Baja', telefono: '915133368', email: 'iam@madrid.es', estado: 'A'   )
    #Entity.create(name: 'Universidad Carlos III', id_tipoente: '3', id_tipo_via: '1', vial:'Lezo', planta:'Baja', telefono: '915133368', email: 'universidad@madrid.es', estado: 'A'   )
    #Entity.create(name: 'Fundación Real Madrid', id_tipoente: '4', id_tipo_via: '1', vial:'Lezo', planta:'Baja', telefono: '915133368', email: 'empresa@madrid.es', estado: 'A'   )

    puts "Creating voluntarios"
    Volunteer.create(name: 'Jose Luis', last_name: 'perez', address_id: 1, phone_number: 'xxxxx', email: 'perezljl@madrid.es')
    Volunteer.create(name: 'Angel', last_name: 'perez', address_id: 2, phone_number: 'xxxxx', email: 'perezljl@madrid.es')
    Volunteer.create(name: 'Alberto', last_name: 'perez', address_id: 3, phone_number: 'xxxxx', email: 'perezljl@madrid.es')


    puts "Creating usuarios"
    pwd = '12345678'
    puts "Creando usuario administrador..."
    User.first_or_initialize(email: 'admin@madrid.es',
                         password: 'Wordpass1',
                         password_confirmation: 'Wordpass1',
                         notice_type: NoticeType.all.sample).save!

    User.create( email: 'voluntario@madrid.es', password: pwd, password_confirmation: pwd, loggable_id: '1', loggable_type: "Volunteer",
                         notice_type: NoticeType.all.sample)
    User.create( email: 'entidad@madrid.es', password: pwd, password_confirmation: pwd, loggable_id: '1', loggable_type: "Entity",
                         notice_type: NoticeType.all.sample)