$(document).ready(function(){

$("#fecha").datepicker({
              language:'es',
              todayHighlight: false,
              format: 'yyyy-mm-dd',
              beforeShowDay: DisableDays

});
$('#fecha').datepicker('setDates', day_c);
$('#fecha').datepicker().on('changeDate', function() {

    window.location.href = "/activities/?day=" + $('#fecha').datepicker('getFormattedDate');
});

function DisableDays(date){
           var formatted = date.getFullYear() + "-" + ("0" + (date.getMonth()+1)).slice(-2) + "-" + ("0"+date.getDate()).slice(-2);
           var str = list_days.toString();
           var res = (str.indexOf(formatted,0) >= 0) ? true : false
           return res

}


    $('#fecha .prev').remove();
$('#fecha .next').remove();
$('#fecha thead tr:nth-child(1)').append('<th class="prev"><i class="fa fa-chevron-left"></i></th>')
$('#fecha thead tr:nth-child(1)').append('<th class="next"><i class="fa fa-chevron-right"></i></th>')

});
