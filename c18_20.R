#[Column 18-20] Aspect: What aspects of Jupyter Notebook make it pleasant to use in your workflow?
dfc18_20 <- data.frame("A1" = df$Aspect..1.What.aspects.of.Jupyter.Notebook.make.it.pleasant.to.use.in.your.workflow.,
                       "A2" = df$Aspect..2.What.aspects.of.Jupyter.Notebook.make.it.pleasant.to.use.in.your.workflow.,
                       "A3" = df$Aspect..3.What.aspects.of.Jupyter.Notebook.make.it.pleasant.to.use.in.your.workflow., stringsAsFactors=FALSE)

text_c18_20 <- paste(dfc18_20, collapse = " ")

corpus_c18_20 <- Corpus(VectorSource(text_c18_20))

corpus_c18_20 <- tm_map(corpus_c18_20, content_transformer(tolower))
corpus_c18_20 <- tm_map(corpus_c18_20, removePunctuation)
corpus_c18_20 <- tm_map(corpus_c18_20, stripWhitespace)
corpus_c18_20 <- tm_map(corpus_c18_20, removeWords, stopwords("en"))

#most frequent words in Column 18_20
dtm_c18_20 <- TermDocumentMatrix(corpus_c18_20)
m_c18_20 <- as.matrix(dtm_c18_20)
v_c18_20 <- sort(rowSums(m_c18_20),decreasing=TRUE)
d_c18_20 <- data.frame(word = names(v_c18_20),freq=v_c18_20)
head(d_c18_20, 10)
par(mar=c(7,5,3,3))
barplot(d_c18_20[1:15,]$freq, las = 2, names.arg = d_c18_20[1:15,]$word,
        col ="#fff2cc", main ="Pleasant aspects of Jupyter Notebook:",
        ylab = "Word frequencies", ylim=c(0,150))



