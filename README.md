![Logotipo de Volun]
(https://raw.githubusercontent.com/IAMDesarrollo/volun_front/master/app/assets/images/FotoPresVolun.jpg)

# Volun

Aplicación de voluntariado

[![Build Status](https://api.travis-ci.org/IAMDesarrollo/volun_front.svg?branch=master)](https://travis-ci.org/IAMDesarrollo/volun_front)
[![Code Climate](https://codeclimate.com/github/IAMDesarrollo/volun_front/badges/gpa.svg)](https://codeclimate.com/github/IAMDesarrollo/volun_front)
[![Coverage Status](https://coveralls.io/github/IAMDesarrollo/volun_front/volun_front?branch=master&service=github)](https://coveralls.io/github/IAMDesarrollo/volun_front/volun_front?branch=master)
[![Dependency Status](https://beta.gemnasium.com/badges/github.com/IAMDesarrollo/volun_front.svg)](https://beta.gemnasium.com/projects/github.com/IAMDesarrollo/volun_front)

Este es el repositorio de código abierto de la Aplicación de Voluntariado, creada originariamente por el Ayuntamiento de Madrid.

## Estado del proyecto

El desarrollo de esta aplicación comenzó el [1 de Septiembre de 2016](https://bitbucket.org/volun_front/volun_frontend/src) y el código fue puesto en producción el día 7 de Abril de 2017 en [IAM](https://voluntariospormadrid.madrid.es). Desde entonces se le añaden mejoras y funcionalidades constantemente. La evolución y futura lista de funcionalidades a implementar se pueden consultar en la lista de [tareas por hacer](https://bitbucket.org/volun/volun_backend/issues).

## Tecnología

El backend de esta aplicación se desarrolla con el lenguaje de programación [Ruby](https://www.ruby-lang.org/) sobre el *framework* [Ruby on Rails](http://rubyonrails.org/).
Las herramientas utilizadas para el frontend no están cerradas aún. Los estilos de la página usan [SCSS](http://sass-lang.com/) sobre [Bootstrap](https://getbootstrap.com/)

## Configuración para desarrollo y tests

Prerequisitos: tener instalado git, Ruby 2.3.3, la gema `bundler`, y PostgreSQL (9.4 o superior).

```

git clone https://perezljl@bitbucket.org/volun_front/volun_frontend.git
cd volun_frontend
bundle install
cp config/database.yml.sample config/database.yml
cp config/secrets.yml.sample config/secrets.yml
rake db:setup
bin/rake db:dev_seed
RAILS_ENV=test bin/rake db:seed


```

Para ejecutar la aplicación en local:
```
bin/rails s
```

Para ejecutar los tests:

```
bin/rspec
```


## Licencia

El código de este proyecto está publicado bajo la licencia AFFERO GPL v3 (ver [LICENSE-AGPLv3.txt](LICENSE-AGPLv3.txt))

## Contribuciones

Ver fichero [CONTRIBUTING_ES.md](CONTRIBUTING_ES.md)


