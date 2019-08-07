PhenotypeTrials_wheat <- read_csv("~/Downloads/PhenotypeTrials_wheat.csv")
PhenotypeData_wheat <- read_csv("~/Downloads/PhenotypeData_wheat.csv")
GeneticCharacters_wheat <- read_csv("~/Downloads/GeneticCharacters_wheat.csv")
LineRecords_wheat <- read_csv("~/Downloads/LineRecords_wheat.csv")


GC_Wheat_melt <- melt(GeneticCharacters_wheat, id=c("Nae", "Property"))
GC_Wheat_Spread <- dcast(GC_Wheat_melt, Nae ~ Property + variable, value.var = "value")

PhenotypeData_melt <- melt(PhenotypeData_wheat, id=c("Trial", "Trait"))
PhenotypeData_Spread <- dcast(PhenotypeData_melt, Trial ~ Trait + variable, value.var="value")

write.csv(GC_Wheat_Spread,'Genetic Characters')
write.csv(PhenotypeData_Spread,'Phenotype Data')

meta <- PhenotypeTrials_wheat %>% select(Trial, location, latitude, longitude)
names(meta) <- c("Experiment", "Location", "WS Lat", "WS Lon")
