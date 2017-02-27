App.Projects = {

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

             var picBaseUrl = "/assets";
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 64, 64).setOffset(0, 15);

             if (multiple == true)
             {
                 $.each(locations, function(i, location) 
                 {
                  
                 var pt = new Point(location.addresses[1].latitude,location.addresses[1].longitude,map.spatialReference);
                 

                 var graficos = new GraphicsLayer();
                 map.addLayer(graficos);

                 var infoTemplate = new InfoTemplate();

                //infoTemplate.setTitle(gon.items[i].nombreproyecto);
                //infoTemplate.setContent("<img src='/assets/" + gon.items[i].description +  "' alt='2'>" +  
                //    "<h2>" + gon.items[i].description + " </h2><br/>" +
                //    "<a href='/proyectos/" + gon.items[i].id  + "/edit'>Leer mas..</a>" );


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

                //infoTemplate.setTitle(gon.items[i].nombreproyecto);
                //infoTemplate.setContent("<img src='/assets/" + gon.items[i].description +  "' alt='2'>" +  
                //    "<h2>" + gon.items[i].description + " </h2><br/>" +
                //    "<a href='/proyectos/" + gon.items[i].id  + "/edit'>Leer mas..</a>" );


                 var g = new Graphic(pt,pms);
                 g.setInfoTemplate(infoTemplate);
                 graficos.add(g); 
              }  

})
}
}

App.Project = {
load_unigeo: function ()
{

 require([
     "esri/geometry/Point", "esri/Color", "esri/InfoTemplate","esri/map",
     "esri/symbols/SimpleMarkerSymbol",  "esri/layers/ArcGISDynamicMapServiceLayer",
     "esri/SpatialReference", "esri/layers/GraphicsLayer", "esri/graphic",
     "esri/layers/ArcGISTiledMapServiceLayer","esri/InfoTemplate","esri/symbols/PictureMarkerSymbol","dojo/dom", "dojo/on", "dojo/domReady!"], 
     function(Point, Color, InfoTemplate, Map,SimpleMarkerSymbol,  ArcGISDynamicMapServiceLayer, 
            SpatialReference, GraphicsLayer, Graphic, ArcGISTiledMapServiceLayer,InfoTemplate,PictureMarkerSymbol,dom, on) 
     {
             var x = locations_project.addresses[1].latitude;
             var y = locations_project.addresses[1].longitude;
             var sr = new SpatialReference({wkid:25830});
             var centro = new Point([x,y],sr);
             var map = new Map("mapDivProject", {           
                     center: centro,
                     spatialReference: sr,
                     zoom: 1});
             var mapabase = new ArcGISTiledMapServiceLayer("<%= Rails.application.secrets.url_map %>",{
                                                               "spatialReference": sr});
             var rotulacion= new ArcGISDynamicMapServiceLayer("<%= Rails.application.secrets.url_rotulacion %>",{
                                                               "spatialReference" : sr});
                                              
             map.addLayer(mapabase);
             map.addLayer(rotulacion);
             //map.addLayer(ndps);
             map.infoWindow.resize(500, 200);

             var picBaseUrl = "/assets";
             var pms = new PictureMarkerSymbol(picBaseUrl + "GreenPin1LargeB.png", 64, 64).setOffset(0, 15);


             $.each(locations_project, function(i, location) 
             {
              
              alert(location);
              var pt = new Point(location.addresses[1].latitude,location.addresses[1].longitude,map.spatialReference);
             

             var graficos = new GraphicsLayer();
             map.addLayer(graficos);

             var infoTemplate = new InfoTemplate();

            //infoTemplate.setTitle(gon.items[i].nombreproyecto);
            //infoTemplate.setContent("<img src='/assets/" + gon.items[i].description +  "' alt='2'>" +  
            //    "<h2>" + gon.items[i].description + " </h2><br/>" +
            //    "<a href='/proyectos/" + gon.items[i].id  + "/edit'>Leer mas..</a>" );


             var g = new Graphic(pt,pms);
             g.setInfoTemplate(infoTemplate);
             graficos.add(g);
          
            });    
           

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




//$(document).ready(load_geo);

$(document).ready(function(){


App.Projects.load_geo();
//App.Project.load_unigeo();
$('#q_addresses_district_id_eq').on('click', function() {
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
                                      "data":{district:$('#q_addresses_district_id_eq').val() },
                                      "async": true,
                                      
                               });
        }); 

})    


