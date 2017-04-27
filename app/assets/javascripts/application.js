// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
// require bootstrap-datetimepicker
//= require jquery.dotdotdot.min
//= require turbolinks
//= require js/locale/i18n_es
// require_directory .




var initialize_modules = function() {
  //App.Projects.load_geo();
  //App.ayuntamiento;
  //App.vendor;

};

$(function(){
  //Turbolinks.enableProgressBar()

  $(document).ready(initialize_modules);
  $(document).on('page:load', initialize_modules);
  $(document).on('ajax:complete', initialize_modules);
  $(document).on('turbolinks:load', initialize_modules);
});



function closeErrores()
{

	$('#errores').hide();
}


function closeAvisos()
{

	$('#avisos').hide();
}


$(document).ready(function(){
        if ($("#rt_entity_subscribe_request_form_attributes_req_reason_id").val()==4)
            $('#other_motive').show();
        else
            $('#other_motive').hide();

        $("#btnGrid").click(function(){
            $('#row').hide();
            $('#grid').show();
         });
        $("#btnRow").click(function(){
            $('#grid').hide();
            $('#row').show();
        });

        $("#rt_entity_subscribe_request_form_attributes_req_reason_id").change(function(){
            if ($("#rt_entity_subscribe_request_form_attributes_req_reason_id").val() == 4)
            {
              $('#other_motive').show();
              $('#rt_entity_subscribe_other_subscribe_reason').val("");
            }
            else
            {
              $('#other_motive').hide();
              $('#rt_entity_subscribe_other_subscribe_reason').val("");
            }
        });







});
