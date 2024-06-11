library(ggplot2)
library(data.table)

df1 <- fread('Economist_Assignment_Data.csv', drop = 1)



pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl <- ggplot(df1, aes(x=CPI, y=HDI)) + geom_point(aes(color=Region), size = 5, shape = 'O', alpha=0.5)
pl2 <- pl + geom_smooth(aes(group=1), method = 'lm', formula=y~log(x), se = FALSE, color='red')
pl3 <- pl2 + geom_text(aes(label=Country), color = 'gray20', data = subset(df1, Country %in% pointsToLabel),check_overlap = TRUE)
pl4 <- pl3 + theme_bw() + scale_x_continuous(name = 'Corruption Perceptions Index, 2011 (10=least corrupt)',limits = c(1, 10), breaks = 1:10)
pl5 <- pl4 + scale_y_continuous(name='Human Development Index, 2011 (1=Best)', limits = c(0.2, 1)) + labs(title = "Corruption and Human development")
print(pl5)

