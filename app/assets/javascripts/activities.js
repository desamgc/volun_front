$(document).ready(function(){

$("#fecha").datepicker({
              language:'es',
              todayHighlight: false,
              format: 'yyyy-mm-dd',
              beforeShowDay: DisableDays

        });
        $('#fecha').datepicker('setDates', day_c);
        $('#fecha').datepicker().on('changeDate', function() {
                           param_day = '{"timetables_execution_date_eq"' + "=>" + "'" + $('#fecha').datepicker('getFormattedDate') + '"}'
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "script",
                                      url: "/activities/search",
                                      success: function(data) {


                                      },
                                      error: function(data){

                                          // mostramos mensaje de error
                                      },
                                      "data":{day:$('#fecha').datepicker('getFormattedDate') },
                                      "async": true,

                               });
        });

        function DisableDays(date){
           var formatted = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
           var str = list_days.toString();
           var res = (str.indexOf(formatted,0) >= 0) ? true : false
           return res

        }


        $('#q_address_district_eq').on('click', function() {
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "json",
                                      url: "/activities/boroughs",
                                      success: function(data) {
                                          $('#q_address_borough_eq').children().remove();
                                          $('#q_address_borough_eq').append("<option value=' ' selected = true></option>");
                                          $.each(data, function(i, location)

                                          {
                                              $('#q_address_borough_eq').append('<option value=' + location + '>' + location + '</option>');

                                          });





                                      },
                                      error: function(data){

                                          $('#q_address_borough_eq').children().remove();
                                      },
                                      "data":{district:$('#q_address_district_eq').val() },
                                      "async": true,

                               });
        });

$('#fecha .prev').remove();
$('#fecha .next').remove();
$('#fecha thead tr:nth-child(1)').append('<th class="prev"><i class="fa fa-chevron-left"></i></th>')
$('#fecha thead tr:nth-child(1)').append('<th class="next"><i class="fa fa-chevron-right"></i></th>')

});


