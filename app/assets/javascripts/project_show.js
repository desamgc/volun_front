
Project = {

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
                     zoom: 1

             });

             map.on("load", function() {
              map.disablePan();
              map.hideZoomSlider();
              map.disableScrollWheelZoom() ;
              map.disableMapNavigation();
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
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 64, 64).setOffset(0, 15);

             if (multiple == true)
             {
                 $.each(locations.addresses, function(i, location)
                 {

                 var pt = new Point((location.latitude/100).toFixed(0),(location.longitude/100).toFixed(0),map.spatialReference);


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
}




$(document).ready(function(){


var map;
var mapabase;
var rotulacion;

Project.load_geo();

})