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
// require modernizr-custom

//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require bootstrap.min
//= require jquery.dotdotdot.min
// require turbolinks
//= require js/locale/i18n_es
//= require video.min
//= require videojsYoutube.min
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
        $(".form-control").datepicker({
          language:'es',
          todayHighlight: false,
          format: 'dd/mm/yyyy',
        });

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





        if ($("#entity_req_reason_id").val()==4)
            $('#other_motive').show();
        else
            $('#other_motive').hide();


        $("#entity_req_reason_id").change(function(){
            if ($("#entity_req_reason_id").val() == 4)
            {
              $('#other_motive').show();
              $('#entity_other_subscribe_reason').val("");
            }
            else
            {
              $('#other_motive').hide();
              $('#entity_other_subscribe_reason').val("");
            }
        });




        $('#q_addresses_district_eq').on('click', function() {
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "json",
                                      url: url,
                                      success: function(data) {
                                          $('#q_addresses_borough_eq').children().remove();
                                          $('#q_addresses_borough_eq').append("<option value=' ' selected = true></option>");
                                          $.each(data, function(i, location)

                                          {
                                              $('#q_addresses_borough_eq').append('<option value=' + '"' + location + '"' + '>' + location + '</option>');

                                          });





                                      },
                                      error: function(data){

                                          $('#q_addresses_borough_eq').children().remove();
                                      },
                                      "data":{district:$('#q_addresses_district_eq').val() },
                                      "async": true,

                               });
        });


        $('#q_address_district_eq').on('click', function() {
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "json",
                                      url: url,
                                      success: function(data) {
                                          $('#q_address_borough_eq').children().remove();
                                          $('#q_address_borough_eq').append("<option value=' ' selected = true></option>");
                                          $.each(data, function(i, location)

                                          {
                                              $('#q_address_borough_eq').append('<option value=' + '"' + location + '"' + '>' + location + '</option>');

                                          });





                                      },
                                      error: function(data){

                                          $('#q_address_borough_eq').children().remove();
                                      },
                                      "data":{district:$('#q_address_district_eq').val() },
                                      "async": true,

                               });
        });


        $('#selectOrdenar').on('change', function() {
                        if ($('#selectOrdenar').val()!= "")
                        {
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "script",
                                      url: 'projects/search',
                                      "data":{order:$('#selectOrdenar').val() },
                                      "async": true,

                               });
                        }
        });











});
