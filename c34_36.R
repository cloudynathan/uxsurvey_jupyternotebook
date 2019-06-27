#[Column 34-36] Industry: What industries does your role and analytical work support? E.g. Journalism, IT, etc.
dfc34_36 <- data.frame("I1" = df$Industry..1.What.industries.does.your.role.and.analytical.work.support..e.g...Journalism..IT..etc...,
                       "I2" = df$Industry..2.What.industries.does.your.role.and.analytical.work.support..e.g...Journalism..IT..etc...,
                       "I3" = df$Industry..3.What.industries.does.your.role.and.analytical.work.support..e.g...Journalism..IT..etc..., stringsAsFactors=FALSE)

text_c34_36 <- paste(dfc34_36, collapse = " ")

corpus_c34_36 <- Corpus(VectorSource(text_c34_36))

corpus_c34_36 <- tm_map(corpus_c34_36, content_transformer(tolower))
corpus_c34_36 <- tm_map(corpus_c34_36, removePunctuation)
corpus_c34_36 <- tm_map(corpus_c34_36, stripWhitespace)
corpus_c34_36 <- tm_map(corpus_c34_36, removeWords, stopwords("en"))

#most frequent words in Column 34_36
dtm_c34_36 <- TermDocumentMatrix(corpus_c34_36)
m_c34_36 <- as.matrix(dtm_c34_36)
v_c34_36 <- sort(rowSums(m_c34_36),decreasing=TRUE)
d_c34_36 <- data.frame(word = names(v_c34_36),freq=v_c34_36)
head(d_c34_36, 10)
par(mar=c(7,5,3,3))
barplot(d_c34_36[1:15,]$freq, las = 2, names.arg = d_c34_36[1:15,]$word,
        col ="#d9d2e9", main ="What industries does your role and work support?",
        ylab = "Word frequencies", ylim=c(0,100))







