#[Column 30-31] Select all the words that best describe Jupyter Notebook.
dfc30_31 <- data.frame("B1" = df$Select.all.the.words.that.best.describe.Jupyter.Notebook.,
                       "B2" = df$Other.word.s...Select.all.the.words.that.best.describe.Jupyter.Notebook., stringsAsFactors=FALSE)
dfc30_31 <- data.frame(do.call(rbind,str_split(dfc30_31$B1, ";")), stringsAsFactors = FALSE)

text_c30_31 <- paste(dfc30_31, collapse = " ")

corpus_c30_31 <- Corpus(VectorSource(text_c30_31))

corpus_c30_31 <- tm_map(corpus_c30_31, content_transformer(tolower))
corpus_c30_31 <- tm_map(corpus_c30_31, removePunctuation)
corpus_c30_31 <- tm_map(corpus_c30_31, stripWhitespace)
corpus_c30_31 <- tm_map(corpus_c30_31, removeWords, stopwords("en"))

#most frequent words in Column 30_31
dtm_c30_31 <- TermDocumentMatrix(corpus_c30_31)
m_c30_31 <- as.matrix(dtm_c30_31)
v_c30_31 <- sort(rowSums(m_c30_31),decreasing=TRUE)
d_c30_31 <- data.frame(word = names(v_c30_31),freq=v_c30_31)
head(d_c30_31, 10)
par(mar=c(7,5,3,3))
barplot(d_c30_31[1:10,]$freq, las = 2, names.arg = d_c30_31[1:10,]$word,
        col ="gray", main ="Words that best describe Jupyter Notebook",
        ylab = "Word frequencies", ylim=c(0,1400))







