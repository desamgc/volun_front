$(document).ready(function(){

$("#fecha").datepicker({
              language:'es',
              todayHighlight: false,
              format: 'yyyy-mm-dd',
              beforeShowDay: DisableDays
});

$("#fecha_home").datepicker({
              language:'es',
              todayHighlight: false,
              format: 'yyyy-mm-dd',
              beforeShowDay: DisableDays
});

$("#fecha_show").datepicker({
              language:'es',
              todayHighlight: false,
              format: 'yyyy-mm-dd',
              beforeShowDay: DisableDays
});


$('#fecha_show').datepicker('setDates', day_c);
$('#fecha_show').datepicker().on('changeDate', function() {
    actualizarActividades("/activities/" + id,$('#fecha_show').datepicker('getFormattedDate'));
});


$('#fecha_home').datepicker('setDates', day_c);
$('#fecha_home').datepicker().on('changeDate', function() {

    window.location.href = "/activities/?day=" + $('#fecha_home').datepicker('getFormattedDate');
});

$('#fecha').datepicker('setDates', day_c);
$('#fecha').datepicker().on('changeDate', function() {
      actualizarActividades("/activities/search",$('#fecha').datepicker('getFormattedDate'));

});

function actualizarActividades(url, parametro) {
                          jQuery.ajax({
                                      type: "GET",
                                      dataType: "script",
                                      url: url,
                                      success: function(data) {


                                      },
                                      error: function(data){

                                          // mostramos mensaje de error
                                      },
                                      "data":{day:parametro },
                                      "async": true,

                               });

}

function DisableDays(date){
           var formatted = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
           var str = list_days.toString();
           var res = (str.indexOf(formatted,0) >= 0) ? true : false
           return res

}


$('#fecha_home .prev').remove();
$('#fecha_home .next').remove();
$('#fecha_home thead tr:nth-child(2)').prepend('<th class="next"><i class="fa fa-chevron-right"></i></th>')
$('#fecha_home thead tr:nth-child(2)').prepend('<th class="prev"><i class="fa fa-chevron-left"></i></th>')


$('#fecha .prev').remove();
$('#fecha .next').remove();
$('#fecha thead tr:nth-child(2)').prepend('<th class="next"><i class="fa fa-chevron-right"></i></th>')
$('#fecha thead tr:nth-child(2)').prepend('<th class="prev"><i class="fa fa-chevron-left"></i></th>')

$('#fecha_show .prev').remove();
$('#fecha_show .next').remove();
$('#fecha_show thead tr:nth-child(2)').prepend('<th class="next"><i class="fa fa-chevron-right"></i></th>')
$('#fecha_show thead tr:nth-child(2)').prepend('<th class="prev"><i class="fa fa-chevron-left"></i></th>')

})
