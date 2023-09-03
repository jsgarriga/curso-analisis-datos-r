#ALQUILERES DE DEPARTAMENTOS

modelo3 <- lm(price~bedrooms+bathrooms+surface_total, data = Regresion_Lineal_Multiple)
summary(modelo3)

Dpt_Tipo <- data.frame(bedrooms=c(2,3),bathrooms=c(1,2),surface_total=c(110,80) )

prediccion4 <- predict(modelo3,Dpt_Tipo)
prediccion4
