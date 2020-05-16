#Data
X1	X2	Y
75	70	80
60	70	75
65	75	78
75	80	89
65	75	76
80	80	87
65	85	90
80	88	89
60	75	80
65	70	90
90	65	75
90	89	75

#Pendugaan parameter regresi metode OLS
data=read.table(file.choose(),header=T)
attach(data)
X=cbind(seq(1),X1,X2)
Beta=solve((t(X)%*%X))%*%t(X)%*%Y
summary(lm(Y~X1+X2))

#Melihat berbagai ditribusi 
help(distribution)

#Membangkitkan data berdistribusi F
x1=rf(n=50,df1=4,df2=5,ncp=0)
x2=rf(n=50,df1=4,df2=5,ncp=20)

#Distribusi F
#Mencari fungsi kepekatan peluang
df(x, df1, df2, ncp, log = FALSE) 
#Mencari nilai P(Q < q)= P(Q < 3.4)
pf(q, df1, df2, ncp, lower.tail = TRUE, log.p = FALSE)
pf(q=2.81,df1=3,df2=46,lower.tail=T)
#Mencari nilai q sedemikian hingga P(Q < q )= p = 0.95
qf(p, df1, df2, ncp, lower.tail = TRUE, log.p = FALSE)
qf(p=0.95,df1=3,df2=46,lower.tail=T)
#Membangkitkan sebaran F
rf(n, df1, df2, ncp)

#Membuat plot versi 1
x=seq(0,30,length=200)
y1=df(x,df1=4,df2=5,ncp=0)
y2=df(x,df1=4,df2=5,ncp=20)
win.graph()
plot(x,y1,type="l",lwd=3,col="red")
lines(x,y2,type="l",lwd=3,col="blue")
legend("topright",title="Distribusi F", c("df1=4,df2=5,ncp=0","df1=4,df2=5,ncp=20"),lty=c(3,3),col=c("green","yellow"))

#Membuat plot versi 2
x=seq(0,30,length=200)
y1=df(x,df1=4,df2=5,ncp=0)
y2=df(x,df1=4,df2=5,ncp=20)
win.graph()
par(mfrow=c(1,2))
plot(x,y1,type="l",lwd=3,col="red")
plot(x,y2,type="l",lwd=3,col="blue")

#membuat legend
legend("topright",title="Distribusi F", c("df1=4,df2=5,ncp=0","df1=4,df2=5,ncp=20"),lty=c(1,1),col=c("green","yellow"))












