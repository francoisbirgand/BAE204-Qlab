################################

data<-read.csv(file="https://raw.githubusercontent.com/francoisbirgand/BAE204-Qlab/master/Lin_1h_cuyahoga_all_2008-2009_SI_ref.csv",header = TRUE) #Reads file into table format
#data<-read.csv(file="/Users/francoisbirgand/Google Drive/Echantillonnage/Methods/Data/Cuyahoga/all/2008-2009/Lin_1h_cuyahoga_all_2008-2009_SI_ref.csv",
#                header = TRUE) #Reads file into table format


WSarea<-707*1.60934^2 #Area of watershed in km2
WS<-"Cuyahoga River at Independence OH"
data<-as.data.frame(data)
data$datetime<-as.POSIXct(strptime(data$datetime, "%Y-%m-%d %H:%M:%S")) # transforms characters into date values understood by R
D<-data$datetime
Q<-data$Q   #Defines Q as the flow value (m3/s)
C<-data$TP

firstyear<-as.numeric(format(data[1,1],'%Y'))
lastyear<-as.numeric(format(data[nrow(data),1],'%Y'))

N=nrow(data)   #Sets N to the value equal to the number of total rows in the table

# definition of the x and y axes limits

L<-Q*C
N=nrow(data)   #Sets N to the value equal to the number of total rows in the table

# definition of the x and y axes limits
xlim = as.POSIXct(c(D[1],D[N]))  # this renders the first and last date understandable for plotting purposes
ylimQ = c(0,max(Q))           # ylim for flow
ylimC = c(0,max(C))           # ylim for concentrations

ScaleF = 1.2                  # scaling factor for size of fonts and other things

y1lab<-expression("Flow rate (" * m^3 * "/s)")  # defines the label for flow
y2lab<-substitute(paste("Nitrate concentration (mg ",NO[x]^{y},"-N)",sep=""),list(x=3,y="-")) # defines the label for concentrations

par(mar=c(4.5,4.5,4,4.5))     # defines the sizes, in number of lines, for the margins (bottom, left, top, right)

ltyp=c(1,2)

plot(D,Q,col="blue",type="l",cex=0.1,yaxt="n",     
     lty=ltyp[1],xaxt="n",xlab="",ylab="",xlim=xlim,ylim=ylimQ)
# we are taking all the default addition of axis tick marks and numbers out by using xaxt and yaxt = "n"
# and setting the axis labels at nothing using xlab = "" and ylab = ""
abline(h=0)
axis.POSIXct(1, at=seq(D[1], D[N], by="month"), format="%m/%d",cex.axis=ScaleF)
# this tells R that we want the X axis ticks and values to be displayed as dates, be added on a monthly basis,
# using the month/day format
axis(2,cex.axis=ScaleF)
# this tells R that the first Y axis ticks can be displayed  (that function was repressed earlier by 'yaxt="n" ')
par(new=TRUE)
# this tells R that a new plot has already been opened, in other words you are telling R to keep adding things
# on the existing plot

ColElmt="deeppink1"
plot(D,C,col=ColElmt,type="l",cex=0.1,yaxt="n",
     lty=ltyp[1],xaxt="n",xlab="",ylab="",xlim=xlim,ylim=ylimC)
# plots the concentration data
axis(4,cex.axis=ScaleF)
# this tells R that the second Y axis ticks can be displayed (that function was repressed earlier by 'yaxt="n" ')
par(new=TRUE)

mtext(paste0("Dates in ",firstyear,"-",lastyear),side=1,line=3,cex=ScaleF) # add in the margin the defined labels and title
mtext(y1lab,side=2,line=3,cex=ScaleF)
mtext(y2lab,side=4,line=3,cex=ScaleF)
mtext(WS,side=3,line=1.5,cex=ScaleF)

legend("topleft",c("Flow","Conc"),lty = c(1,1), col = c("blue",ColElmt))