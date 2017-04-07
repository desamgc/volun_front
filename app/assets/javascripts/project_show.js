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
                                      url: "/projects/" + id,
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





})