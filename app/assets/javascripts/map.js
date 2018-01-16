function load_map ()
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
             var centro =  new Point([446137,4475471],sr);
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 30, 30).setOffset(0, 15);
             if (typeof (map) != "undefined") map.destroy();

             if (lock == true)
             {
                  map = new Map("mapDiv", {
                     center: centro,
                     spatialReference: sr,
                     logo: false,
                     //maxZoom: 5
                     //smartNavigation: false
                  });
                  map.enablePan();
                  map.showZoomSlider();
                  map.enableScrollWheelZoom() ;
                  map.enableMapNavigation();
                  map.setZoom(5);

             }
             else
             {
                  centro = new Point([(locations[0].address.latitude/100).toFixed(0),(locations[0].address.longitude/100).toFixed(0)],sr);
                  map = new Map("mapDiv", {
                     center: centro,
                     spatialReference: sr,
                     logo: false
                     //smartNavigation: false
                  });
                  map.enablePan();
                  map.showZoomSlider();
                  map.enableScrollWheelZoom() ;
                  map.enableMapNavigation();
                  map.setZoom(5);
                  map.centerAt(centro);
             }

             mapabase = new ArcGISTiledMapServiceLayer(url_map ,{"spatialReference": sr});
             //rotulacion= new ArcGISDynamicMapServiceLayer(url_rotulacion,{"spatialReference" : sr});
             map.addLayer(mapabase);
             //map.addLayer(rotulacion);
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
load_map();
})



