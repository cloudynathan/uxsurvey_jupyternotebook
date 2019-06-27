#[Column 7-9]What, if anything, hinders you from making Jupyter Notebook an even more regular part of your workflow?
dfc7_9 <- data.frame("TA1" = df$Tool...Application..1.What.tools.and.applications..if.any..would.you.like.to.see.more.tightly.integrated.with.Jupyter.Notebook.....,
                     "TA2" = df$Tool...Application..2.What.tools.and.applications..if.any..would.you.like.to.see.more.tightly.integrated.with.Jupyter.Notebook.....,
                     "TA3" = df$Tool...Application..3.What.tools.and.applications..if.any..would.you.like.to.see.more.tightly.integrated.with.Jupyter.Notebook....., stringsAsFactors=FALSE)

text_c7_9 <- paste(dfc7_9, collapse = " ")

corpus_c7_9 <- Corpus(VectorSource(text_c7_9))

corpus_c7_9 <- tm_map(corpus_c7_9, content_transformer(tolower))
corpus_c7_9 <- tm_map(corpus_c7_9, removePunctuation)
corpus_c7_9 <- tm_map(corpus_c7_9, stripWhitespace)
corpus_c7_9 <- tm_map(corpus_c7_9, removeWords, stopwords("en"))

#most frequent words in Column 7_9
dtm_c7_9 <- TermDocumentMatrix(corpus_c7_9)
m_c7_9 <- as.matrix(dtm_c7_9)
v_c7_9 <- sort(rowSums(m_c7_9),decreasing=TRUE)
d_c7_9 <- data.frame(word = names(v_c7_9),freq=v_c7_9)
head(d_c7_9, 10)
par(mar=c(6,5,3,3))
barplot(d_c7_9[1:15,]$freq, las = 2, names.arg = d_c7_9[1:15,]$word,
        col ="#f4cccc", main ="Jupyter Notebook users want better integration with:",
        ylab = "Word frequencies", ylim=c(0,100))

###Jupyter Notebook users want better integration with: git, vim, matplotlib, emacs, github, and spark 





