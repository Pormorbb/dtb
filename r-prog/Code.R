## classification

library(tidyverse)
library(caret)
library(mlbench)

data("PimaIndiansDiabetes") ##load data again

df <- PimaIndiansDiabetes

## check / inspect data null data clean
sum(complete.cases(df)) ##count missiong values
mean(complete.cases(df)) ==1
glimpse(df)

## logistic regreesion ='glm'
set.seed(42)

ctrl <- trainControl (method = "cv",
                      number = 5)
glm_model <- train(diabetes ~ age + glucose + pressure,
             data = df, 
             method = "glm",
             trControl = ctrl)
glm_model$finalModel

## variable importance
varImp(glm_model)

## regression => high bias
## data cheahe => model doesn't change that much

##save model .RDS
saveRDS(glm_model, "Logistics_reg.RDS")

##caret: confusion metrix
confusionMatrix(p,df$diabetes,
                positive ="pos",
                mode = "prec_recall")
## precition recall F1
##friend's Computer
model <- readRDS("Logistics_reg.RDS")

