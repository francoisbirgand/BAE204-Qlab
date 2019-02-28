```{r eval =FALSE, echo = FALSE}
cumQSort<-c(0,(cumsum(QSort[-1])+cumsum(head(QSort,-1)))/2)
cumQSort<-cumQSort/tail(cumQSort,1)*100
cumLSort<-c(0,(cumsum(LSort[-1])+cumsum(head(LSort,-1)))/2)
cumLSort<-cumLSort/tail(cumLSort,1)*100
```
