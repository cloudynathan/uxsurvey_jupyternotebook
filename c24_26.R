#[Column 24-26] Feature Change: What new features or changes would you like to see in Jupyter Notebook? Please list anything that comes to mind that helps you in your workflow, big or small.
dfc24_26 <- data.frame("FC1" = df$Feature...Change..1.What.new.features.or.changes.would.you.like.to.see.in.Jupyter.Notebook...Please.list.anything.that.comes.to.mind.that.helps.you.in.your.workflow..big.or.small..,
                       "FC2" = df$Feature...Change..2.What.new.features.or.changes.would.you.like.to.see.in.Jupyter.Notebook...Please.list.anything.that.comes.to.mind.that.helps.you.in.your.workflow..big.or.small..,
                       "FC3" = df$Feature...Change..3.What.new.features.or.changes.would.you.like.to.see.in.Jupyter.Notebook...Please.list.anything.that.comes.to.mind.that.helps.you.in.your.workflow..big.or.small.., stringsAsFactors=FALSE)

text_c24_26 <- paste(dfc24_26, collapse = " ")

corpus_c24_26 <- Corpus(VectorSource(text_c24_26))

corpus_c24_26 <- tm_map(corpus_c24_26, content_transformer(tolower))
corpus_c24_26 <- tm_map(corpus_c24_26, removePunctuation)
corpus_c24_26 <- tm_map(corpus_c24_26, stripWhitespace)
corpus_c24_26 <- tm_map(corpus_c24_26, removeWords, stopwords("en"))

#most frequent words in Column 24_26
dtm_c24_26 <- TermDocumentMatrix(corpus_c24_26)
m_c24_26 <- as.matrix(dtm_c24_26)
v_c24_26 <- sort(rowSums(m_c24_26),decreasing=TRUE)
d_c24_26 <- data.frame(word = names(v_c24_26),freq=v_c24_26)
head(d_c24_26, 10)
par(mar=c(7,5,3,3))
barplot(d_c24_26[1:15,]$freq, las = 2, names.arg = d_c24_26[1:15,]$word,
        col ="#d9ead3", main ="What new features would you like to see?",
        ylab = "Word frequencies", ylim=c(0,200))

#check for Themes (e.g. better, integration)
x1_dfc24_26 <- dfc24_26
x1_c24_26_FC1 <- x1_dfc24_26[grep("better",x1_dfc24_26$FC1),]
x1_c24_26_FC2 <- x1_dfc24_26[grep("better",x1_dfc24_26$FC2),]
x1_c24_26_FC3 <- x1_dfc24_26[grep("better",x1_dfc24_26$FC3),]
x1_c24_26_FC1$FC2 <- NULL
x1_c24_26_FC1$FC3 <- NULL
x1_c24_26_FC2$FC1 <- NULL
x1_c24_26_FC2$FC3 <- NULL
x1_c24_26_FC3$FC1 <- NULL
x1_c24_26_FC3$FC2 <- NULL
x1_c24_26_FC <- rowr::cbind.fill(x1_c24_26_FC1, x1_c24_26_FC2, x1_c24_26_FC3, fill=NA)

x2_dfc24_26 <- dfc24_26
x2_c24_26_FC1 <- x2_dfc24_26[grep("integration",x2_dfc24_26$FC1),]
x2_c24_26_FC2 <- x2_dfc24_26[grep("integration",x2_dfc24_26$FC2),]
x2_c24_26_FC3 <- x2_dfc24_26[grep("integration",x2_dfc24_26$FC3),]
x2_c24_26_FC1$FC2 <- NULL
x2_c24_26_FC1$FC3 <- NULL
x2_c24_26_FC2$FC1 <- NULL
x2_c24_26_FC2$FC3 <- NULL
x2_c24_26_FC3$FC1 <- NULL
x2_c24_26_FC3$FC2 <- NULL
x2_c24_26_FC <- rowr::cbind.fill(x2_c24_26_FC1, x2_c24_26_FC2, x2_c24_26_FC3, fill=NA)

##Themes associated with "better": -want better text editor
#                                  -want better undo
#                                  -want better UI

##Themes associated with "integration": -git integration
#                                       -d3 integration










