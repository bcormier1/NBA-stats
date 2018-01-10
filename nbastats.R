#Final
#load packages
library(corrplot)
#read data
nba = read.csv("MYSPORTSFEEDS-CUMULATIVE_PLAYER_STATS-NBA-20162017REGULAR.csv",header=T)



#Height in the NBA
nba$X.Height = factor(nba$X.Height,levels(nba$X.Height)[c(4,5,2,3,6,7,10:17,8,9,18:21)])

#histogram of heights
plot(nba$X.Height,xlab="Height in feet and inches")

#boxplots
#scoring versus height
par(mfrow=c(1,3))
plot(nba$X.Height, nba$X.FgPct, xlab="Height", ylab="Scoring Percentage",main="Height VS Scoring Percentage")
plot(nba$X.Height, nba$X.Fg2PtPct, xlab="Height", ylab="2-point Scoring Percentage",main="Height VS 2-Point Scoring Percentage")
plot(nba$X.Height, nba$X.Fg3PtPct, xlab="Height", ylab="3-point Scoring Percentage",main="Height VS 3-Point Scoring Percentage")
#blocks and height
plot(nba$X.Height, nba$X.BlkPerGame, xlab="Height", ylab="Blocks per Game",main="Height VS Blocks per Game")


mean(nba$X.FgPct)
mean(nba$X.Fg2PtPct)
mean(nba$X.Fg3PtPct)


#General stats
genStats = cbind(nba$X.PtsPerGame, nba$X.AstPerGame, nba$X.RebPerGame, nba$X.BlkPerGame, nba$X.StlPerGame)
colnames(genStats) = c("Points", "Assists", "Rebounds", "Blocks", "Steals")

pairs(genStats,cex=0.5)

corrplot(cor(genStats))


#skill
plot(nba$X.AstPerGame, nba$X.Fg3PtPct,main="Assists Vs Three-point Percentage",xlab="Assists per Game",ylab="3-point Percentage")

#playing time
plot(nba$X.GamesPlayed, nba$X.PtsPerGame,main="Games Vs Points",xlab="Games Played",ylab="Points per Game")
abline(lm(nba$X.PtsPerGame~nba$X.GamesPlayed),col="red",lwd=2)


par(mfrow=c(1,2))
plot(nba$X.MinSecondsPerGame, nba$X.PtsPerGame,main="Minutes Vs Points",xlab="Minutes Played per Game",ylab="Points per Game")
plot(nba$X.MinSecondsPerGame,lm(nba$X.MinSecondsPerGame~nba$X.PtsPerGame)$residuals,main="Residuals",xlab="Minutes Played per Game",ylab="Residuals")
lines(lowess(nba$X.MinSecondsPerGame,lm(nba$X.MinSecondsPerGame~nba$X.PtsPerGame)$residuals),col='red',lwd=3)

