function load_geo ()
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
             var centro =  new Point([446137,4475471],sr);
             map = new Map("mapDiv", {
                     center: centro,
                     spatialReference: sr,
                     //smartNavigation: false
             });
             if (lock == true)
             {
                  map.on("load", function() {
                  map.disablePan();
                  map.hideZoomSlider();
                  map.disableScrollWheelZoom() ;
                  map.disableMapNavigation();
                  map.setZoom(1);
                 });
             }
             else
             {
              map.enablePan();
              map.showZoomSlider();
              map.enableScrollWheelZoom() ;
              map.enableMapNavigation();
              map.setZoom(7);
              centro = new Point([(locations[0].address.latitude/100).toFixed(0),(locations[0].address.longitude/100).toFixed(0)],sr);
              map.centerAt(centro);

             }

             map.removeAllLayers();
             mapabase = new ArcGISTiledMapServiceLayer(url_map ,{
                                                               "spatialReference": sr});
             rotulacion= new ArcGISDynamicMapServiceLayer(url_rotulacion,{
                                                               "spatialReference" : sr});

             map.addLayer(mapabase);
             map.addLayer(rotulacion);
             //map.addLayer(ndps);
             map.infoWindow.resize(500, 200);
             var picBaseUrl = "/assets/";
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 30, 30).setOffset(0, 15);
             $.each(locations, function(i, location)
             {
                       var pt = new Point((location.address.latitude/100).toFixed(0),(location.address.longitude/100).toFixed(0),map.spatialReference);
                       var graficos = new GraphicsLayer();
                       map.addLayer(graficos);
                       var infoTemplate = new InfoTemplate();
                       var g = new Graphic(pt,pms);
                       //g.setInfoTemplate(infoTemplate);
                       graficos.add(g);
             });




})
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
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 30, 30).setOffset(0, 15);
             map.removeAllLayers();

             if (lock == true)
             {
                  map.on("load", function() {
                  map.disablePan();
                  map.hideZoomSlider();
                  map.disableScrollWheelZoom() ;
                  map.disableMapNavigation();
                  map.setZoom(1);
                 });
             }
             else
             {
                   map.enablePan();
                   map.showZoomSlider();
                   map.enableScrollWheelZoom() ;
                   map.enableMapNavigation();
                   var centro = new Point([(locations[0].address.latitude/100).toFixed(0),(locations[0].address.longitude/100).toFixed(0)],sr);
                   map.centerAt(centro);
             }

             mapabase = new ArcGISTiledMapServiceLayer(url_map ,{
                                                              "spatialReference": sr});
             rotulacion= new ArcGISDynamicMapServiceLayer(url_rotulacion,{
                                                               "spatialReference" : sr});

             map.addLayer(mapabase);
             map.addLayer(rotulacion);
             map.infoWindow.resize(500, 200);
             $.each(locations, function(i, location)
             {
                       var pt = new Point((location.address.latitude/100).toFixed(0),(location.address.longitude/100).toFixed(0),map.spatialReference);
                       var graficos = new GraphicsLayer();
                       map.addLayer(graficos);
                       var infoTemplate = new InfoTemplate();
                       var g = new Graphic(pt,pms);
                       //g.setInfoTemplate(infoTemplate);
                       graficos.add(g);
             });




      })
}









$(document).ready(function(){


var map = "";
var mapabase;
var rotulacion;
load_geo();

})



