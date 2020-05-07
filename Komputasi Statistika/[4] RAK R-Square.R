#DataRAK
V1	V2	V3	V4	V5
6.78	6.88	9.29	7.92	7.5
6.51	7.4	10.73	8.54	7.19
6.92	6.8	10	6.46	6.88
7.08	6.08	9.17	7.09	5.94

>RAK=read.table(file.choose(),header=T)
>attach(RAK)
>RAK=as.matrix(RAK)
>#Menentukan banyak perlakuan (p) dan banyak ulangan (n)
p=ncol(RAK)
n=nrow(RAK)
># Menghitung JK Total Terkoreksi
JK=0
for(i in 1:n){
    for(j in 1:p){
        JK=JK+(RAK[i,j])^2
    }
}
JKTOTAL=JK-(sum(RAK)^2)/(n*p) 

>#Menghitung JK Perlakuan Terkoreksi
jk=0
for (j in 1:p){
	T[j]=sum(RAK[,j])
	jk=jk+(T[j])^2
}
JKPerlakuan=(jk/n)-(sum(RAK)^2)/(n*p)

>#Menghitung JK Blok
jk=0
for (i in 1:n){
	T[i]=sum(RAK[i,])
	jk=jk+(T[i])^2
}
JKBlok=(jk/p)-(sum(RAK)^2)/(n*p)


# Menghitung JK Galat
JKGalat = JKTOTAL- JKPerlakuan - JKBlok

># Menghitung KT, F, p value, RSQUARE
KTP=JKPerlakuan/(p-1)
KTB=JKBlok/(n-1)
KTG=JKGalat/((p-1)*(n-1))
F1=KTP/KTG
F2=KTB/KTG
Ftabel = qf(0.95, p-1,(p-1)*(n-1))
Ftabel = qf(0.95, n-1,(p-1)*(n-1))
Pvalue = 1-pf(F1, p-1,(p-1)*(n-1))
Pvalue = 1-pf(F2, n-1,(p-1)*(n-1))
RSquare=100*(1-(JKGalat/JKTOTAL))
RSquareAdj=100*(1-((JKGalat/((p-1)*(n-1))/(JKTOTAL/(n*p-1)))))
BNT=qt(0.025,(p-1)*(n-1))*sqrt(2*KTG/n)








