#[Column 21-23] Aspect 1: What aspects of Jupyter Notebook make it difficult to use in your workflow?
dfc21_23 <- data.frame("A1" = df$Aspect..1.What.aspects.of.Jupyter.Notebook.make.it.difficult.to.use.in.your.workflow.,
                       "A2" = df$Aspect..2.What.aspects.of.Jupyter.Notebook.make.it.difficult.to.use.in.your.workflow.,
                       "A3" = df$Aspect..3.What.aspects.of.Jupyter.Notebook.make.it.difficult.to.use.in.your.workflow., stringsAsFactors=FALSE)

text_c21_23 <- paste(dfc21_23, collapse = " ")

corpus_c21_23 <- Corpus(VectorSource(text_c21_23))

corpus_c21_23 <- tm_map(corpus_c21_23, content_transformer(tolower))
corpus_c21_23 <- tm_map(corpus_c21_23, removePunctuation)
corpus_c21_23 <- tm_map(corpus_c21_23, stripWhitespace)
corpus_c21_23 <- tm_map(corpus_c21_23, removeWords, stopwords("en"))

#most frequent words in Column 21_23
dtm_c21_23 <- TermDocumentMatrix(corpus_c21_23)
m_c21_23 <- as.matrix(dtm_c21_23)
v_c21_23 <- sort(rowSums(m_c21_23),decreasing=TRUE)
d_c21_23 <- data.frame(word = names(v_c21_23),freq=v_c21_23)
head(d_c21_23, 10)
par(mar=c(7,5,3,3))
barplot(d_c21_23[1:15,]$freq, las = 2, names.arg = d_c21_23[1:15,]$word,
        col ="#ffe599", main ="Difficult aspects of Jupyter Notebook:",
        ylab = "Word frequencies", ylim=c(0,100))

#check for Themes (e.g. lack, hard, difficult)
x1_dfc21_23 <- dfc21_23
x1_c21_23_A1 <- x1_dfc21_23[grep("lack",x1_dfc21_23$A1),]
x1_c21_23_A2 <- x1_dfc21_23[grep("lack",x1_dfc21_23$A2),]
x1_c21_23_A3 <- x1_dfc21_23[grep("lack",x1_dfc21_23$A3),]
x1_c21_23_A1$A2 <- NULL
x1_c21_23_A1$A3 <- NULL
x1_c21_23_A2$A1 <- NULL
x1_c21_23_A2$A3 <- NULL
x1_c21_23_A3$A1 <- NULL
x1_c21_23_A3$A2 <- NULL
x1_c21_23_A <- rowr::cbind.fill(x1_c21_23_A1, x1_c21_23_A2, x1_c21_23_A3, fill=NA)

x2_dfc21_23 <- dfc21_23
x2_c21_23_A1 <- x2_dfc21_23[grep("hard",x2_dfc21_23$A1),]
x2_c21_23_A2 <- x2_dfc21_23[grep("hard",x2_dfc21_23$A2),]
x2_c21_23_A3 <- x2_dfc21_23[grep("hard",x2_dfc21_23$A3),]
x2_c21_23_A1$A2 <- NULL
x2_c21_23_A1$A3 <- NULL
x2_c21_23_A2$A1 <- NULL
x2_c21_23_A2$A3 <- NULL
x2_c21_23_A3$A1 <- NULL
x2_c21_23_A3$A2 <- NULL
x2_c21_23_A <- rowr::cbind.fill(x2_c21_23_A1, x2_c21_23_A2, x2_c21_23_A3, fill=NA)

x3_dfc21_23 <- dfc21_23
x3_c21_23_A1 <- x3_dfc21_23[grep("difficult",x3_dfc21_23$A1),]
x3_c21_23_A2 <- x3_dfc21_23[grep("difficult",x3_dfc21_23$A2),]
x3_c21_23_A3 <- x3_dfc21_23[grep("difficult",x3_dfc21_23$A3),]
x3_c21_23_A1$A2 <- NULL
x3_c21_23_A1$A3 <- NULL
x3_c21_23_A2$A1 <- NULL
x3_c21_23_A2$A3 <- NULL
x3_c21_23_A3$A1 <- NULL
x3_c21_23_A3$A2 <- NULL
x3_c21_23_A <- rowr::cbind.fill(x3_c21_23_A1, x3_c21_23_A2, x3_c21_23_A3, fill=NA)

##Themes associated with "lack": -lack of version control
#                                -lack of integration
#                                -lack of collaborative system/multi user support 

##Themes associated with "hard": -hard to use git diff

##Themes associated with "difficult": -difficult to work with large notebooks
#                                     -difficult to use Notebook with git












