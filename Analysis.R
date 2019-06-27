#####################################
###2015 Jupyter Notebook UX Survey###
#####################################

#load packages
library(dplyr)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(reshape2)
library(rowr)
library(stringr)

#load data, plot complete vs partical, remove partical rows
df <- read.csv("C:/workspaceR/2015_Notebook_UX_Survey/Survey.csv", stringsAsFactors = FALSE)
df$Status <- as.factor(df$Status)
plot(df$Status, ylim=c(0,1000), main="Complete vs. Partial surveys") #[Column 3]
df <- dplyr::filter(df, Status == "Complete")

#convert to factors
df$Time.Started <- as.factor(df$Time.Started)
df$Date.Submitted <- as.factor(df$Date.Submitted)
df$How.often.do.you.use.Jupyter.Notebook. <- as.factor(df$How.often.do.you.use.Jupyter.Notebook.)
df$Roughly.how.long.have.you.been.using.Jupyter.Notebook. <- as.factor(df$Roughly.how.long.have.you.been.using.Jupyter.Notebook.)
df$How.do.you.run.the.Jupyter.Notebook. <- as.factor(df$How.do.you.run.the.Jupyter.Notebook.)
df$How.many.years.have.you.been.in.this.role.. <- as.factor(df$How.many.years.have.you.been.in.this.role..)
df$How.many.people.typically.see.and.or.interact.with.the.results.of.your.work.in.Jupyter.Notebook...Consider.people.who.view.your.notebooks.on.nbviewer..colleagues.who.rerun.your.notebooks..developers.who.star.your.notebook.repos.on.GitHub..audiences.who.see.your.notebooks.as.slideshows..etc.. <- as.factor(df$How.many.people.typically.see.and.or.interact.with.the.results.of.your.work.in.Jupyter.Notebook...Consider.people.who.view.your.notebooks.on.nbviewer..colleagues.who.rerun.your.notebooks..developers.who.star.your.notebook.repos.on.GitHub..audiences.who.see.your.notebooks.as.slideshows..etc..)

#[Column 4] How often do you use Jupyter Notebook? 
df <- subset(df, How.often.do.you.use.Jupyter.Notebook. != "")
df$How.often.do.you.use.Jupyter.Notebook. <- factor(df$How.often.do.you.use.Jupyter.Notebook., levels=c("Daily", "Weekly", "Less often than monthly", "Monthly"))
pcolumn4 <- factor(df$How.often.do.you.use.Jupyter.Notebook., labels = c("Daily", "Weekly", "Less often than monthly", "Monthly"))
par(mar=c(10,3,2,2))
plot(pcolumn4, ylim = c(0,500), las = 2, main="How often do you use Jupyter Notebook?")

#[Column 6] Roughly how long have you been using Jupyter Notebook?
df <- subset(df, Roughly.how.long.have.you.been.using.Jupyter.Notebook. != "")
pcolumn6 <- factor(df$Roughly.how.long.have.you.been.using.Jupyter.Notebook., labels = c("Less than one year", "One year or more"))
par(mar=c(9,3,3,3))
plot(pcolumn6, ylim = c(0,600), las = 2, main="Roughly how long have you been using Jupyter Notebook?")

#[Column 10] How do you run the Jupyter Notebook? 
df <- subset(df, How.do.you.run.the.Jupyter.Notebook. != "")
pcolumn10 <- factor(df$How.do.you.run.the.Jupyter.Notebook., labels = c("Standalone application", "Other - Write In", "Through Jupyter Hub"))
par(mar=c(11,3,5,2))
plot(pcolumn10, ylim = c(0,700), las = 2, main="How do you run the Jupyter Notebook?")

#[Column 30-31] Select all the words that best describe Jupyter Notebook.
source("c30_31.R")

#[Column 32] What is your primary role when using Jupyter Notebook?
text_c32 <- paste(df$What.is.your.primary.role.when.using.Jupyter.Notebook..e.g...student..astrophysicist..financial.modeler..business.manager..etc..., collapse = " ")

corpus_c32 <- Corpus(VectorSource(text_c32))

corpus_c32 <- tm_map(corpus_c32, content_transformer(tolower))
corpus_c32 <- tm_map(corpus_c32, removePunctuation)
corpus_c32 <- tm_map(corpus_c32, stripWhitespace)
corpus_c32 <- tm_map(corpus_c32, removeWords, stopwords("en"))

dtm_c32 <- TermDocumentMatrix(corpus_c32)
m_c32 <- as.matrix(dtm_c32)
v_c32 <- sort(rowSums(m_c32),decreasing=TRUE)
d_c32 <- data.frame(word = names(v_c32),freq=v_c32)
head(d_c32, 10)
par(mar=c(6,5,3,2))
barplot(d_c32[1:10,]$freq, las = 2, names.arg = d_c32[1:10,]$word,
        col ="gray", main ="Who uses Jupyter Notebook?",
        ylab = "Word frequencies", ylim=c(0,200))

#[Column 33] How many years have you been in this role? 
df <- subset(df, How.many.years.have.you.been.in.this.role.. != "")
df$How.many.years.have.you.been.in.this.role.. <- factor(df$How.many.years.have.you.been.in.this.role.., levels=c("Less than 1 year", "1 year", "2-5 years", "5+ years"))
pcolumn33 <- factor(df$How.many.years.have.you.been.in.this.role.., labels = c("Less than 1 year", "1 year", "2-5 years", "5+ years"))
par(mar=c(8,3,5,2))
plot(pcolumn33, ylim = c(0,400), las = 2, main="How many years have you been in your role?")

#[Column 37] How many people typically see and or interact with the results of your work in Jupyter Notebook? 
df <- subset(df, How.many.people.typically.see.and.or.interact.with.the.results.of.your.work.in.Jupyter.Notebook...Consider.people.who.view.your.notebooks.on.nbviewer..colleagues.who.rerun.your.notebooks..developers.who.star.your.notebook.repos.on.GitHub..audiences.who.see.your.notebooks.as.slideshows..etc.. != "")
pcolumn37 <- data.frame(df$How.many.people.typically.see.and.or.interact.with.the.results.of.your.work.in.Jupyter.Notebook...Consider.people.who.view.your.notebooks.on.nbviewer..colleagues.who.rerun.your.notebooks..developers.who.star.your.notebook.repos.on.GitHub..audiences.who.see.your.notebooks.as.slideshows..etc..)
colnames(pcolumn37) <- "c37"
pcolumn37$c37 <- factor(pcolumn37$c37)
pcolumn37$c37 <- factor(pcolumn37$c37, levels=c("Under ten","Tens","Hundreds","Thousands","Tens of thousands","Hundreds of thousands or more"))
pcolumn37$c37 <- factor(pcolumn37$c37, labels = c("Under ten","Tens","Hundreds","Thousands","10,000+","100,000+"))
par(mar=c(8,4,5,2))
plot(pcolumn37, ylim = c(0,500), las = 2, main="How many people typically see and or interact with the results of your work in Jupyter Notebook?")

###################################
source("c5.R")
source("c7_9.R")
source("c12_14.R")
source("c15_17.R")
source("c18_20.R")
source("c21_23.R")
source("c24_26.R")
source("c27_29.R")
source("c34_36.R")




