Projects = {

load_geo: function ()
{



 require([
     "esri/geometry/Point", "esri/Color", "esri/InfoTemplate","esri/map",
     "esri/symbols/SimpleMarkerSymbol",  "esri/layers/ArcGISDynamicMapServiceLayer",
     "esri/SpatialReference", "esri/layers/GraphicsLayer", "esri/graphic",
     "esri/layers/ArcGISTiledMapServiceLayer","esri/InfoTemplate","esri/symbols/PictureMarkerSymbol","dojo/dom", "dojo/on", "dojo/domReady!"],
     function(Point, Color, InfoTemplate, Map,SimpleMarkerSymbol,  ArcGISDynamicMapServiceLayer,
            SpatialReference, GraphicsLayer, Graphic, ArcGISTiledMapServiceLayer,InfoTemplate,PictureMarkerSymbol,dom, on)
     {

             var sr = new SpatialReference({wkid:25830});
             var centro =  (multiple == true) ?  new Point([446137,4475471],sr) : new Point([locations.addresses[1].latitude,locations.addresses[1].longitude],sr);
             var zoom = (multiple == true) ? 1 : 7;
             map = new Map("mapDiv", {
                     center: centro,
                     spatialReference: sr,
                     zoom: 2

             });

             mapabase = new ArcGISTiledMapServiceLayer(url_map ,{
                                                              "spatialReference": sr});
             rotulacion= new ArcGISDynamicMapServiceLayer(url_rotulacion,{
                                                               "spatialReference" : sr});

             map.addLayer(mapabase);
             map.addLayer(rotulacion);
             //map.addLayer(ndps);
             map.infoWindow.resize(500, 200);

             var picBaseUrl = "/assets/";
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 24, 24).setOffset(0, 15);

             if (multiple == true)
             {
                 $.each(locations, function(i, location)
                 {
                 var pt = new Point((location.address.latitude/100).toFixed(0),(location.address.longitude/100).toFixed(0),map.spatialReference);


                 var graficos = new GraphicsLayer();
                 map.addLayer(graficos);

                 var infoTemplate = new InfoTemplate();


                 infoTemplate.setTitle(location.name);
                 infoTemplate.setContent("<img src='/assets/1.jpg' alt='2'>" +
                "<h2>" + location.description + " </h2><br/>" +
                "<a href='/projects/" + location.id  + "/edit'>Leer mas..</a>" );

                 var g = new Graphic(pt,pms);
                 g.setInfoTemplate(infoTemplate);
                 graficos.add(g);

                });
              }
              else
              {

                 var pt = new Point((locations.address.latitude/100).toFixed(0),(locations.address.longitude/100).toFixed(0),map.spatialReference);


                 var graficos = new GraphicsLayer();
                 map.addLayer(graficos);

                 var infoTemplate = new InfoTemplate();

                 var g = new Graphic(pt,pms);
                 g.setInfoTemplate(infoTemplate);
                 graficos.add(g);
              }

})
}







}




function load_coordenadas ()
{

 require([
     "esri/geometry/Point", "esri/Color", "esri/InfoTemplate","esri/map",
     "esri/symbols/SimpleMarkerSymbol",  "esri/layers/ArcGISDynamicMapServiceLayer",
     "esri/SpatialReference", "esri/layers/GraphicsLayer", "esri/graphic",
     "esri/layers/ArcGISTiledMapServiceLayer","esri/InfoTemplate","esri/symbols/PictureMarkerSymbol","dojo/dom", "dojo/on", "dojo/domReady!"],
     function(Point, Color, InfoTemplate, Map,SimpleMarkerSymbol,  ArcGISDynamicMapServiceLayer,
            SpatialReference, GraphicsLayer, Graphic, ArcGISTiledMapServiceLayer,InfoTemplate,PictureMarkerSymbol,dom, on)
     {
             var picBaseUrl = "/assets/";
             var sr = new SpatialReference({wkid:25830});
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 20, 20).setOffset(0, 15);
             map.removeAllLayers();
             mapabase = new ArcGISTiledMapServiceLayer(url_map ,{
                                                              "spatialReference": sr});
             rotulacion= new ArcGISDynamicMapServiceLayer(url_rotulacion,{
                                                               "spatialReference" : sr});

             map.addLayer(mapabase);
             map.addLayer(rotulacion);

             if (multiple == true)
             {
                 $.each(locations, function(i, location)
                 {
                 var pt = new Point((location.address.latitude/100).toFixed(0),(location.address.longitude/100).toFixed(0),map.spatialReference);

                 var graficos = new GraphicsLayer();
                 map.addLayer(graficos);
                 var infoTemplate = new InfoTemplate();

                 var g = new Graphic(pt,pms);
                 g.setInfoTemplate(infoTemplate);
                 graficos.add(g);

                });
              }
              else
              {

                 var pt = new Point((locations.address.latitude/100).toFixed(0),(locations.address.longitude/100).toFixed(0),map.spatialReference);


                 var graficos = new GraphicsLayer();
                 map.addLayer(graficos);

                 var infoTemplate = new InfoTemplate();

                 var g = new Graphic(pt,pms);
                 g.setInfoTemplate(infoTemplate);
                 graficos.add(g);
              }

      })
}





function showCoordinates(evt) {

    require(["dojo/dom"], function(dom) {

                                                 var mp = evt.mapPoint;
                                                 //display mouse coordinates
                                                 dom.byId("info").innerHTML = mp.x.toFixed(3) + ", " + mp.y.toFixed(3);
   })
}






$(document).ready(function(){


var map;
var mapabase;
var rotulacion;

Projects.load_geo();


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
                                      url: "/activities/" + id,
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
