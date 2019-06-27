#[Column 15-17] Workflow need: What needs in your workflow does Jupyter Notebook not address?
dfc15_17 <- data.frame("WN1" = df$Workflow.Need..1.What.needs.in.your.workflow.does.Jupyter.Notebook.not.address.,
                       "WN2" = df$Workflow.Need..2.What.needs.in.your.workflow.does.Jupyter.Notebook.not.address.,
                       "WN3" = df$Workflow.Need..3.What.needs.in.your.workflow.does.Jupyter.Notebook.not.address., stringsAsFactors=FALSE)

text_c15_17 <- paste(dfc15_17, collapse = " ")

corpus_c15_17 <- Corpus(VectorSource(text_c15_17))

corpus_c15_17 <- tm_map(corpus_c15_17, content_transformer(tolower))
corpus_c15_17 <- tm_map(corpus_c15_17, removePunctuation)
corpus_c15_17 <- tm_map(corpus_c15_17, stripWhitespace)
corpus_c15_17 <- tm_map(corpus_c15_17, removeWords, stopwords("en"))

#most frequent words in Column 15_17
dtm_c15_17 <- TermDocumentMatrix(corpus_c15_17)
m_c15_17 <- as.matrix(dtm_c15_17)
v_c15_17 <- sort(rowSums(m_c15_17),decreasing=TRUE)
d_c15_17 <- data.frame(word = names(v_c15_17),freq=v_c15_17)
head(d_c15_17, 10)
par(mar=c(7,5,3,3))
barplot(d_c15_17[1:15,]$freq, las = 2, names.arg = d_c15_17[1:15,]$word,
        col ="#f9cb9c", main ="Workflow needs Jupyter Notebook does NOT address:",
        ylab = "Word frequencies", ylim=c(0,150))


