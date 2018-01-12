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
// require turbolinks
//= require datepicker
//= require datepicker_es.min
//= require init

$(function(){
  //Turbolinks.enableProgressBar()


});



function closeErrores()
{

  $('#errores').hide();
}


function closeAvisos()
{

  $('#avisos').hide();
}


function actualizarCombos(origen,destino,url ) {
                            jQuery.ajax({
                                      type: "GET",
                                      dataType: "json",
                                      url: url,
                                      success: function(data) {
                                          $("#" + destino).children().remove();
                                          $("#" + destino).append("<option value=' ' selected = true></option>");
                                          $.each(data, function(i, location)

                                          {
                                              $("#" + destino).append('<option value=' + '"' + location + '"' + '>' + location + '</option>');

                                          });

                                      },
                                      error: function(data){

                                          $("#" + destino).children().remove();
                                      },
                                      "data":{district: $("#" + origen).val() },
                                      "async": true,

                               });

}




$(document).ready(function(){
        $(".form-control").datepicker({
          language:'es',
          todayHighlight: false,
          format: 'dd/mm/yyyy',
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
            actualizarCombos("q_addresses_district_eq","q_addresses_borough_eq",url);
        });


        $('#q_address_district_eq').on('click', function() {
            actualizarCombos("q_address_district_eq", "q_address_borough_eq",url)
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

