#[Column 5]What, if anything, hinders you from making Jupyter Notebook an even more regular part of your workflow?
text_c5 <- paste(df$What..if.anything..hinders.you.from.making.Jupyter.Notebook.an.even.more.regular.part.of.your.workflow., collapse = " ")

corpus_c5 <- Corpus(VectorSource(text_c5))

corpus_c5 <- tm_map(corpus_c5, content_transformer(tolower))
corpus_c5 <- tm_map(corpus_c5, removePunctuation)
corpus_c5 <- tm_map(corpus_c5, stripWhitespace)
corpus_c5 <- tm_map(corpus_c5, removeWords, stopwords("en"))

#most frequent words in column 5
dtm_c5 <- TermDocumentMatrix(corpus_c5)
m_c5 <- as.matrix(dtm_c5)
v_c5 <- sort(rowSums(m_c5),decreasing=TRUE)
d_c5 <- data.frame(word = names(v_c5),freq=v_c5)
head(d_c5, 10)
par(mar=c(6,5,3,2))
barplot(d_c5[1:15,]$freq, las = 2, names.arg = d_c5[1:15,]$word,
        col ="gray", main ="What hinders you from making Jupyter Notebook an even more regular part of your workflow?",
        ylab = "Word frequencies", ylim=c(0,250))

findFreqTerms(dtm_c5, 30)

#reponses with keywords, examine common themes
x1_c5 <- df[grep("lack",df$What..if.anything..hinders.you.from.making.Jupyter.Notebook.an.even.more.regular.part.of.your.workflow.),]
x2_c5 <- df[grep("need",df$What..if.anything..hinders.you.from.making.Jupyter.Notebook.an.even.more.regular.part.of.your.workflow.),]
x3_c5 <- df[grep("difficult",df$What..if.anything..hinders.you.from.making.Jupyter.Notebook.an.even.more.regular.part.of.your.workflow.),]

##Themes associated with "lack": -Lacks debugger
#                                -Poor text editor
#                                -Lacks cut and paste function between notebooks
#                                -Lacks version control

##Themes associated with "need": -Needs version control
#                                -Notebook is simply not needed as a regular part of the workflow

##Themes associated with "difficult": -Difficult to collaborate
#                                     -Version control
#                                     -Difficult to manage code cells





