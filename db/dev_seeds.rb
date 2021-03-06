Faker::Config.locale = I18n.locale

ACTIVITIES_NUM    = 50
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
    latitude:              (441900 * 100) + rand(1000),
    longitude:             (4479566 * 100)+ rand(1000),
    district:              District.all.sample.name,
    borough:               Faker::Address.state,
    normalize:             false
  )
end

puts "Creando entidades"
(1..ENTITIES_NUM).each do |n|
  entity = Entity.create!(
    name:                     "#{Entity.model_name.human} #{n}",
    email:                    Faker::Internet.email,
    representative_name:      Faker::Name.name,
    representative_last_name: Faker::Name.last_name,
    contact_name:             Faker::Name.name,
    contact_last_name:        Faker::Name.last_name,
    entity_type:              EntityType.all.sample,
    address:                  Address.all.sample,
    vat_number:               %w(Z8383769K 38741046F).sample,
    req_reason_id: 1,
    phone_number: '915133368')

  puts "Creando links"
    (1..1).each do |n|
      link = Link.create!(
        description:   "#link entidad #{n}",
        link_type_id: 1,
        path: rand(1..16).to_s + ".jpg",
        linkable: entity
    )
  end
end


 puts "Creating voluntarios"
    Volunteer.create(name: 'Jose Luis', last_name: 'perez', address_id: 1, phone_number: 'xxxxx', email: 'perezljl@madrid.es')
    Volunteer.create(name: 'Angel', last_name: 'perez', address_id: 2, phone_number: 'xxxxx', email: 'perezljl@madrid.es')
    Volunteer.create(name: 'Alberto', last_name: 'perez', address_id: 3, phone_number: 'xxxxx', email: 'perezljl@madrid.es')




puts "Creando actividades"
(1..ACTIVITIES_NUM).each do |n|
    activity   = Activity.new()
    activity.attributes = {
      name:                  "Actividad de agenda #{n}" ,
      description:           "Descripción actividad #{n}",
      start_date:   Time.now,
      end_date:     rand(100).days.since.to_date,
      transport: Faker::Lorem.name,
      entity: Entity.first

    }

    activity.save!

    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.where(normalize: false).sample,
        eventable:  activity,
      )

      puts "Creando Horarios para evento de actividad #{event.id}"
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
        link_type_id: 1,
        path: "#{n}.jpg",
        linkable: activity
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 2,
        path: "#{n}.jpg",
        linkable: activity
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 3,
        path: "http://www.marca.com",
        linkable: activity
    )
    end
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 4,
        path: "https://www.youtube.com/embed/videoseries?list=PLhnvwI6F9eqVUaJCrFft9L54vp9eCFxzh",
        linkable: activity
    )
    end

    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 5,
        path: "#{n}.pdf",
        linkable: activity
    )
    end


end





puts "Creando Proyectos urgent"
(1..PROJECTS_NUM_OUTSTANDING).each do |n|
    project_other = Pt::Other.new()
    project   = Project.new()
    project.attributes = {
      name:                  "Texto libre #{n}",
      description:           "Mas texto libre  #{n}",
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
      outstanding:           false,
      urgent:                true,
      contact_name:          Faker::Lorem.name,
      contact_last_name:     Faker::Lorem.name,
      pt_extendable:         project_other

    }

    project.save!

    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.where(normalize: false).sample,
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
        link_type_id: 1,
        path:  rand(1..16).to_s + ".jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 2,
        path: "#{n}.jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 3,
        path: "http://www.marca.com",
        linkable: project
    )
    end
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 4,
        path: "https://www.youtube.com/embed/videoseries?list=PLhnvwI6F9eqVUaJCrFft9L54vp9eCFxzh",
        linkable: project
    )
    end

end




puts "Creando Proyectos featured"
(1..PROJECTS_NUM_FEATURED).each do |n|
    project_other = Pt::Other.new()
    project   = Project.new()
    project.attributes = {
      name:                  "Nombre del proyecto destacado #{n}",
      description:           "Descripción del proyecto destacado #{n}",
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
      outstanding:           true,
      contact_name:          Faker::Lorem.name,
      contact_last_name:     Faker::Lorem.name,
      pt_extendable:         project_other

    }

    project.save!
    project.areas << Area.all.sample

    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.where(normalize: false).sample,
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
        link_type_id: 1,
        path:  rand(1..16).to_s + ".jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 2,
        path: "#{n}.jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 3,
        path: "http://www.marca.com",
        linkable: project
    )
    end
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 4,
        path: "https://www.youtube.com/embed/videoseries?list=PLhnvwI6F9eqVUaJCrFft9L54vp9eCFxzh",
        linkable: project
    )
    end

end




puts "Creando Proyectos"
(1..PROJECTS_NUM).each do |n|
    project_other = Pt::Other.new()
    project   = Project.new()
    project.attributes = {
      name:                  "Nombre del proyecto ... #{n}",
      description:           "Descripción del proyecto .. #{n}",
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
      outstanding:           false,
      contact_name:           Faker::Lorem.name,
      contact_last_name:           Faker::Lorem.name,
      pt_extendable:         project_other
    }

    project.save!

    project.areas << Area.all.sample
    project.volunteers << Volunteer.first
    project.activities << Activity.all.sample
    puts "Creando Eventos"
    2.times do
      event = Event.create!(
        address:    Address.where(normalize: false).sample,
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
        link_type_id: 1,
        path:  rand(1..16).to_s  + ".jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 2,
        path: "#{n}.jpg",
        linkable: project
    )
    end
    (2..LINKS_NUM).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 3,
        path: "http://www.marca.com",
        linkable: project
    )
    end
    (1..1).each do |n|
      link = Link.create!(
        description:   Faker::Lorem.sentence,
        link_type_id: 4,
        path: "https://www.youtube.com/embed/videoseries?list=PLhnvwI6F9eqVUaJCrFft9L54vp9eCFxzh",
        linkable: project
    )
    end

end








    #puts "Creating entidades"
    #Entity.create(name: 'Ayuntamiento de Madrid', id_tipoente: '1', id_tipo_via: '1', vial:'Maria Molina', planta:'Baja', telefono: '915133368', email: 'ayuntamiento@madrid.es', estado: 'A'   )
    #Entity.create(name: 'IAM', id_tipoente: '1', id_tipo_via: '1', vial:'Maria Molina', planta:'Baja', telefono: '915133368', email: 'iam@madrid.es', estado: 'A'   )
    #Entity.create(name: 'Universidad Carlos III', id_tipoente: '3', id_tipo_via: '1', vial:'Lezo', planta:'Baja', telefono: '915133368', email: 'universidad@madrid.es', estado: 'A'   )
    #Entity.create(name: 'Fundación Real Madrid', id_tipoente: '4', id_tipo_via: '1', vial:'Lezo', planta:'Baja', telefono: '915133368', email: 'empresa@madrid.es', estado: 'A'   )



    puts "Creating usuarios"
    pwd = '12345678'
    puts "Creando usuario administrador..."

    puts "#{I18n.t('creating')} entity user"
    attributes = {
      login: 'entity',
      email: 'entidad@madrid.es',
      password: pwd,
      password_confirmation: pwd,
      loggable: Entity.first,
      notice_type_id: 1,
      terms_of_service: true,
      confirmed_at:          '2017-12-28 15:16:14.568274'
    }
    user = User.find_or_initialize_by(login: attributes[:login])

    if user.new_record?
      user.attributes = attributes
      user.save!
    else
      user.update_attributes!(attributes)
    end

    puts "#{I18n.t('creating')} voluntary user"
    attributes = {
      email:                 'voluntario@madrid.es',
      login:                 'volunteering',
      password:              pwd,
      password_confirmation: pwd,
      loggable:              Volunteer.first,
      notice_type:           NoticeType.all.sample,
      terms_of_service: true,
      confirmed_at:          '2017-12-28 15:16:14.568274'
    }
    user = User.find_or_initialize_by(login: attributes[:login])

    if user.new_record?
      user.attributes = attributes
      user.save!
    else
      user.update_attributes!(attributes)
    end
    # users of pre
     #User.create(login: 'entidad@madrid.es', email: 'entidad@madrid.es', password: '12345678', password_confirmation: '12345678', loggable_id: 1, loggable_type: 'Entity', notice_type_id: 1)
     #User.create(login: 'voluntario@madrid.es', email: 'voluntario@madrid.es', password: '12345678', password_confirmation: '12345678', loggable_id: 1, loggable_type: 'Volunteer', notice_type_id: 1)

