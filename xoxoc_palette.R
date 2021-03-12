######################### xoxOC palette: by Amy Wray  #########################
#### a palette inspired by your favorite characters from 2000s teen dramas ####
############## special thanks to Grace Vaziri for input on colors #############


install.packages("unikn")
install.packages("ggplot2")
install.packages("ggridges")
install.packages("maps")
install.packages("rnaturalearth")
install.packages("rnaturalearthdata")
install.packages("sf")

library(unikn)
library(ggplot2)
library(ggridges)
library(maps)
library(rnaturalearth)
library(rnaturalearthdata)
library(sf)


#### OC colors: ####
oc_main<-c("#07486D","#4796B5","#ABCBC8","#F8E77E","#EEA94A","#F56848","#AF2817")
seth<-c("#D24641", "#AFD1DC","#F0AF5F","#DFDCC5", "#5E5564", "#78ACDC","#9D7B4F")
ryan<-c("#1E1C17",  "#C9C0AE","#3C749B", "#DCB293","#406642","#A59065", "#EED202")
sandy<-c("#4F89B9","#C4820F", "#003262", "#C8C7C6","#5DBCD2","#611615", "#9894A3")
kirsten<-c("#BFA8BF","#CB4740","#E8C6A7","#8CA77E", "#805050","#EDECC9","#C8B9AC")
marissa<-c("#B4BDD7","#C07295","#8dd08a","#E6D797","#99223E","#F0CAD5","#1F253B")
summer<-c("#EABFB9","#E4002B","#FFEC82","#3FA6CF","#C1B6EF","#381C00","#6EB8B4")

#### GG colors: ####
gg_main<-c("#CFB06F","#437B88","#EA93A0","#9F3537","#97BC50","#FE5D2B","#ADA9A4")
blair<-c("#0F4D92","#7EB66D","#E6E05E","#E90304","#9DCEF0","#603F83","#DD96B8") 
serena<-c("#f5dd29","#1B61B1","#F08080","#900524","#f5ea92","#488544","#D2AC47") 
chuck<-c("#951522","#F1DABB","#210C2B","#6A81AE","#CB82AC","#43312D","#8FABAE")
lily<-c("#CC2957","#D2BFB1","#833494","#D1BC85","#3DBDD6","#836253","#CE8FA4") 
rufus<-c("#742B0C","#E3A15E","#D8CED1","#AA6835","#BBA4A3","#9E130E","#B8BECA")
nate<-c("#00356B","#EEE8B7","#5E1305","#C7B9AC","#115A5C","#B9C2E1","#9B3253")
georgina<-c("#3A302D","#7B90D1","#923547","#9DA2A3","#403079","#BC7494","#5C4D46")
jenny<-c("#000000","#FBE5AB","#242424","#645BBC","#1B1B1B","#5CAA56", "#141414")


#### peep the palettes ####

##view 1 palette:
seecol(oc_main)
seecol(gg_main)

##view all colors in palettes:
seecol(list(oc_main, seth, ryan, sandy, kirsten, marissa, summer),n=7, 
       title="welcome to the OC palette", 
       pal_names=c("main","seth", "ryan", "sandy", "kirsten", "marissa", "summer"))

seecol(list(gg_main, blair, serena, chuck, lily, rufus, nate, georgina, jenny),n=7, 
       title="xoxo palette",
       pal_names=c("main","blair","serena", "chuck", "lily", "rufus", "nate", "georgina", "jenny"))

#### examples:####

#### create some fake data

df<-data.frame(ID=c(rep("a",10),rep("b",10),rep("c",10),rep("d",10),
                    rep("e",10),rep("f",10),rep("g",10)),
               v1=rnorm(70,0,100),
               v2=runif(70, 0, 1))

### figures:

ggplot(df, aes(x=ID, y=v1, fill=factor(ID)))+
  geom_boxplot(outlier.shape=NA)+
  geom_point(pch=1)+
  scale_fill_manual(values=serena)+
  theme_minimal()

ggplot(df, aes(x=v2, y=ID, fill=ID))+
  geom_density_ridges(alpha=0.8)+
  scale_fill_manual(values=blair)+
  scale_y_discrete(limits=rev(df$ID))+
  theme_classic()

## you can also use colors for maps:
map(database="state")
map(database="state", regions=c("arizona","california","colorado","idaho","nevada","oregon","utah"),
    col=gg_main, fill=TRUE, add=TRUE)

## OC main palette can also be used as a continuous gradient:

world <- ne_countries(scale = "medium", returnclass = "sf")

ggplot(data=world)+
  geom_sf(aes(fill=pop_est), lwd=0.05, color="white")+
  scale_fill_gradientn(colours=oc_main, na.value="gray50")

