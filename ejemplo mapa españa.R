library(mapSpain)

munips <- esp_get_munic()
Box <- esp_get_can_box()
Line <- esp_get_can_provinces()

ggplot(munips) +
  geom_sf() +
  geom_sf(data = Box) +
  geom_sf(data = Line) +
  theme_linedraw()


# representar en el mapa el ganador de cada periodo electoral

# primer hay que sacar el ganador de election_tidy

mapa_elecciones <- 
  election_tidy |> 
  mutate(periodo_electoral = case_when(fecha == "03-2008" ~ "Marzo 2008",
                                       fecha == "11-2011" ~ "Noviembre 2011",
                                       fecha == "12-2015" ~ "Diciciembre 2015", 
                                       fecha == "06-2016" ~ "Junio 2016", 
                                       fecha == "04-2019" ~ "Abril 2019", 
                                       fecha == "11-2019" ~ "Noviembre 2019")) |> 
  summarise(votos = max(votos), .by = c("periodo_electoral", "codigo_municipio", "codigo_provincia")) |> 
  left_join(election_tidy |> 
              mutate(periodo_electoral = case_when(fecha == "03-2008" ~ "Marzo 2008",
                                                   fecha == "11-2011" ~ "Noviembre 2011",
                                                   fecha == "12-2015" ~ "Diciciembre 2015", 
                                                   fecha == "06-2016" ~ "Junio 2016", 
                                                   fecha == "04-2019" ~ "Abril 2019", 
                                                   fecha == "11-2019" ~ "Noviembre 2019")) |> 
              select("periodo_electoral", "codigo_municipio", "codigo_provincia", "votos", "siglas"),
            by = c("periodo_electoral", "codigo_municipio", "codigo_provincia", "votos")) |> 
  right_join(munips, by = c("codigo_provincia" = "cpro", "codigo_municipio" = "cmun")) |> 
  mutate(siglas = if_else(ine.ccaa.name == "País Vasco", "", siglas))
  
ggplot(mapa_elecciones |> filter(periodo_electoral == "Marzo 2008")) +
  geom_sf(aes(geometry = geometry, 
              fill = siglas)) +
  geom_sf(data = Box) +
  geom_sf(data = Line) +
  theme_gg +
  scale_fill_manual(values = setNames(colores_partidos, c(siglas_interes, "OTROS")))

ggplot(mapa_elecciones |> filter(periodo_electoral == "Noviembre 2011")) +
  geom_sf(aes(geometry = geometry, 
              fill = siglas)) +
  geom_sf(data = Box) +
  geom_sf(data = Line) +
  theme_linedraw() +
  scale_fill_manual(values = setNames(c(colores_partidos, "white"), c(siglas_interes, "OTROS", "")))
