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
             var map = new Map("mapDiv", {
                     center: centro,
                     spatialReference: sr,
                     zoom: zoom});
             var mapabase = new ArcGISTiledMapServiceLayer(url_map ,{
                                                               "spatialReference": sr});
             var rotulacion= new ArcGISDynamicMapServiceLayer(url_rotulacion,{
                                                               "spatialReference" : sr});

             map.addLayer(mapabase);
             map.addLayer(rotulacion);
             //map.addLayer(ndps);
             map.infoWindow.resize(500, 200);

             var picBaseUrl = "/assets/";
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 64, 64).setOffset(0, 15);

             if (multiple == true)
             {
                 $.each(locations, function(i, location)
                 {

                 var pt = new Point(location.addresses[1].latitude,location.addresses[1].longitude,map.spatialReference);


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
                 var pt = new Point(locations.addresses[1].latitude,locations.addresses[1].longitude,map.spatialReference);


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






function showCoordinates(evt) {

    require(["dojo/dom"], function(dom) {

                                                 var mp = evt.mapPoint;
                                                 //display mouse coordinates
                                                 dom.byId("info").innerHTML = mp.x.toFixed(3) + ", " + mp.y.toFixed(3);
   })
}






$(document).ready(function(){


Projects.load_geo();

$('#q_addresses_district_eq').on('click', function() {
                           jQuery.ajax({
                                      type: "GET",
                                      dataType: "json",
                                      url: "/projects/boroughs",
                                      success: function(data) {
                                          $('#q_addresses_borough_eq').children().remove();
                                          $.each(data, function(i, location)

                                          {
                                              $('#q_addresses_borough_eq').append('<option value=' + location + '>' + location + '</option>');

                                          });





                                      },
                                      error: function(data){

                                          $('#q_addresses_borough_eq').children().remove();
                                      },
                                      "data":{district:$('#q_addresses_district_eq').val() },
                                      "async": true,

                               });
        });

})



