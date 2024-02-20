nuevo_dir<- "C:/practica 4.1"
setwd(nuevo_dir)

spear <- read_excel("C:/practica 4.1/spearheads.xlsx")
View(spear)
str(spear)
class(spear)

spear <- as.data.frame(spear)
class(spear)

2#
names(spear)[names(spear) == "Mat"] <- "Materiales"
names(spear)[names(spear) == "Con"] <- "Contexto"
names(spear)[names(spear) == "Cond"] <- "Conservacion"
names(spear)[names(spear) == "Loo"] <- "Loop"
names(spear)[names(spear) == "Peg"] <- "Remache"
names(spear)[names(spear) == "Date"] <- "Fecha"
names(spear)[names(spear) == "Maxle"] <- "Longitud_max"
names(spear)[names(spear) == "Socle"] <- "Longitud_encaje"
names(spear)[names(spear) == "Maxwi"] <- "Ancho_max"
names(spear)[names(spear) == "Upsoc"] <- "Ancho_encaje"
names(spear)[names(spear) == "Maxwit"] <- "Ancho_max_encaje"
names(spear)[names(spear) == "Weight"] <- "Peso"
spear
View(spear)

3#

spear$Contexto=factor(spear$Contexto,levels=c('1','2','3'),labels=c("S/C", "Habitacional", "Funerario"))
spear$Conservacion=factor(spear$Conservacion,levels=c(1,2,3,4),labels=c("Excelente", "Bueno", "Regular","Malo"))
spear$Remache=factor(spear$Remache,levels=c(1,2),labels=c('Si', 'No'))
spear$Materiales=factor(spear$Materiales,levels=c(1,2),labels=c('Bronce', 'Hierro'))

View(spear)

4#

freq.mat=table(spear$Materiales)
View(freq.mat)
freq.con=table(spear$Contexto)
View(freq.con)
freq.cond=table(spear$Conservacion)
View(freq.cond)

5#

cross.condcon=table(spear$Conservacion,spear$Contexto)
cross.condcon
cross.condmat=table(spear$Conservacion,spear$Materiales)
cross.condmat

6#

prop.mat=prop.table(freq.mat)
View(prop.mat)
prop.mat <- as.data.frame(prop.mat)
prop.mat$Porcentaje <- prop.mat$Freq * 100
prop.mat

prop.com=prop.table(freq.com)
View(prop.com)
prop.com <- as.data.frame(prop.com)
prop.com$Porcentaje <- prop.com$Freq * 100
prop.com

prop.cond=prop.table(freq.cond)
View(prop.cond)
prop.cond <- as.data.frame(prop.cond)
prop.cond$Porcentaje <- prop.cond$Freq * 100
prop.cond

7#

prop.cross.condcon=round(prop.table(cross.condcon)*100,0)
View(prop.cross.condcon)
prop.cross.condmat=round(prop.table(cross.condmat)*100,0)
View(prop.cross.condmat)

8#

bar.cond=barplot(table(spear$Conservacion))
bar.con=barplot(table(spear$Contexto))