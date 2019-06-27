#[Column 27-29] Enhancement: Thinking back to when you first started using Jupyter Notebook, what enhancements would you have made to make your initial experience better?
dfc27_29 <- data.frame("E1" = df$Enhancement..1.Thinking.back.to.when.you.first.started.using.Jupyter.Notebook..what.enhancements.would.have.made.your.initial.experience.better.,
                       "E2" = df$Enhancement..2.Thinking.back.to.when.you.first.started.using.Jupyter.Notebook..what.enhancements.would.have.made.your.initial.experience.better.,
                       "E3" = df$Enhancement..3.Thinking.back.to.when.you.first.started.using.Jupyter.Notebook..what.enhancements.would.have.made.your.initial.experience.better., stringsAsFactors=FALSE)

text_c27_29 <- paste(dfc27_29, collapse = " ")

corpus_c27_29 <- Corpus(VectorSource(text_c27_29))

corpus_c27_29 <- tm_map(corpus_c27_29, content_transformer(tolower))
corpus_c27_29 <- tm_map(corpus_c27_29, removePunctuation)
corpus_c27_29 <- tm_map(corpus_c27_29, stripWhitespace)
corpus_c27_29 <- tm_map(corpus_c27_29, removeWords, stopwords("en"))

#most frequent words in Column 27_29
dtm_c27_29 <- TermDocumentMatrix(corpus_c27_29)
m_c27_29 <- as.matrix(dtm_c27_29)
v_c27_29 <- sort(rowSums(m_c27_29),decreasing=TRUE)
d_c27_29 <- data.frame(word = names(v_c27_29),freq=v_c27_29)
head(d_c27_29, 10)
par(mar=c(7,5,3,3))
barplot(d_c27_29[1:15,]$freq, las = 2, names.arg = d_c27_29[1:15,]$word,
        col ="#c9daf8", main ="What enchancements would make your initial experience better?",
        ylab = "Word frequencies", ylim=c(0,100))

#check for Themes (e.g. documentation, kernels)
x1_dfc27_29 <- dfc27_29
x1_c27_29_E1 <- x1_dfc27_29[grep("documentation",x1_dfc27_29$E1),]
x1_c27_29_E2 <- x1_dfc27_29[grep("documentation",x1_dfc27_29$E2),]
x1_c27_29_E3 <- x1_dfc27_29[grep("documentation",x1_dfc27_29$E3),]
x1_c27_29_E1$E2 <- NULL
x1_c27_29_E1$E3 <- NULL
x1_c27_29_E2$E1 <- NULL
x1_c27_29_E2$E3 <- NULL
x1_c27_29_E3$E1 <- NULL
x1_c27_29_E3$E2 <- NULL
x1_c27_29_E <- rowr::cbind.fill(x1_c27_29_E1, x1_c27_29_E2, x1_c27_29_E3, fill=NA)

x2_dfc27_29 <- dfc27_29
x2_c27_29_E1 <- x2_dfc27_29[grep("kernel",x2_dfc27_29$E1),]
x2_c27_29_E2 <- x2_dfc27_29[grep("kernel",x2_dfc27_29$E2),]
x2_c27_29_E3 <- x2_dfc27_29[grep("kernel",x2_dfc27_29$E3),]
x2_c27_29_E1$E2 <- NULL
x2_c27_29_E1$E3 <- NULL
x2_c27_29_E2$E1 <- NULL
x2_c27_29_E2$E3 <- NULL
x2_c27_29_E3$E1 <- NULL
x2_c27_29_E3$E2 <- NULL

x3_dfc27_29 <- dfc27_29
x3_c27_29_E1 <- x3_dfc27_29[grep("kernels",x3_dfc27_29$E1),]
x3_c27_29_E2 <- x3_dfc27_29[grep("kernels",x3_dfc27_29$E2),]
x3_c27_29_E3 <- x3_dfc27_29[grep("kernels",x3_dfc27_29$E3),]
x3_c27_29_E1$E2 <- NULL
x3_c27_29_E1$E3 <- NULL
x3_c27_29_E2$E1 <- NULL
x3_c27_29_E2$E3 <- NULL
x3_c27_29_E3$E1 <- NULL
x3_c27_29_E3$E2 <- NULL

x23_c27_29_E <- rowr::cbind.fill(x2_c27_29_E1, x2_c27_29_E2, x2_c27_29_E3, x3_c27_29_E1, x3_c27_29_E2, x3_c27_29_E3, fill=NA)
colnames(x23_c27_29_E) <- c("E1", "E2", "E3", "E4", "E5", "E6")

##Themes associated with "documentation": -better documentation (especially intro documentation)

##Themes associated with "kernels": -add more kernels
#                                   -easier installation of kernels








