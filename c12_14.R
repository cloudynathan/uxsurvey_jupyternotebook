#[Column 12-14] Workflow need: What needs in your workflow does Jupyter Notebook address?
dfc12_14 <- data.frame("WN1" = df$Workflow.Need..1.What.needs.in.your.workflow.does.Jupyter.Notebook.address.,
                     "WN2" = df$Workflow.Need..2.What.needs.in.your.workflow.does.Jupyter.Notebook.address.,
                     "WN3" = df$Workflow.Need..3.What.needs.in.your.workflow.does.Jupyter.Notebook.address., stringsAsFactors=FALSE)

text_c12_14 <- paste(dfc12_14, collapse = " ")

corpus_c12_14 <- Corpus(VectorSource(text_c12_14))

corpus_c12_14 <- tm_map(corpus_c12_14, content_transformer(tolower))
corpus_c12_14 <- tm_map(corpus_c12_14, removePunctuation)
corpus_c12_14 <- tm_map(corpus_c12_14, stripWhitespace)
corpus_c12_14 <- tm_map(corpus_c12_14, removeWords, stopwords("en"))

#most frequent words in Column 12_14
dtm_c12_14 <- TermDocumentMatrix(corpus_c12_14)
m_c12_14 <- as.matrix(dtm_c12_14)
v_c12_14 <- sort(rowSums(m_c12_14),decreasing=TRUE)
d_c12_14 <- data.frame(word = names(v_c12_14),freq=v_c12_14)
head(d_c12_14, 10)
par(mar=c(7,5,3,3))
barplot(d_c12_14[1:15,]$freq, las = 2, names.arg = d_c12_14[1:15,]$word,
        col ="#fce5cd", main ="Workflow needs Jupyter Notebook addresses:",
        ylab = "Word frequencies", ylim=c(0,300))
