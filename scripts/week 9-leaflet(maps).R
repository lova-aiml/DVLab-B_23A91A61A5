#install package
install.packages("leaflet")
#Load the library
library(leaflet)
#Very Basic Map
leaflet()%>%
  addTiles()
#Map Centered on a Location
leaflet()%>%
  addTiles()%>%
  setView(
    lng=78.9629,
    lat=20.5937,
    zoom=5
  )
#Add a Marker Example: New Delhi
leaflet()%>%
  addTiles()%>%
  addMarkers(
    lng=77.2088,
    lat=28.6139
  )
#Marker with Popup Information 
leaflet()%>%
  addTiles()%>%
  addMarkers(
    lng=77.2088,
    lat=28.6139,
    popup="New Delhi"
  )
#Multiple Markers
cities<-data.frame(
  name=c("Delhi","Mumbai","Chennai","Kolkata"),
  lat=c(28.6139,18.9582,13.0827,22.5744),
  lng=c(77.2088,72.8321,80.2707,88.3629)
)
leaflet(cities)%>%
  addTiles()%>%
  addMarkers(
    lng=~lng,
    lat=~lat,
    popup=~name
  )
#Circle Markers (Instead of pins,use circles)
leaflet(cities)%>%
  addTiles()%>%
  addCircleMarkers(
    lng=~lng,
    lat=~lat,
    radius=6,
    color="red",
    popup=~name
  )