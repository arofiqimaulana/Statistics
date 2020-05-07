#DataRAL
V1	V2	V3	V4	V5
6.78	6.88	9.29	7.92	7.5
6.51	7.4	10.73	8.54	7.19
6.92	6.8	10	6.46	6.88
7.08	6.08	9.17	7.09	5.94
>RAL=read.table(file.choose(),header=T)
>RAL=as.matrix(RAL)
>#Menentukan banyak perlakuan (p) dan banyak ulangan (n)
p=ncol(RAL)
n=nrow(RAL)
># Menghitung JK Total Terkoreksi
JK=0
for(i in 1:n){
    for(j in 1:p){
        JK=JK+(RAL[i,j])^2
    }
}
JKTOTAL=JK-(sum(RAL)^2)/(n*p) 

>#Menghitung JK Perlakuan Terkoreksi
jk=0
for (j in 1:p){
	T[j]=sum(RAL[,j])
	jk=jk+(T[j])^2
}
JKPerlakuan=(jk/n)-(sum(RAL)^2)/(n*p)

># Menghitung JK Galat
JKGalat = JKTOTAL- JKPerlakuan

># Menghitung KT, F, p value, RSQUARE
KTP=JKPerlakuan/(p-1)
KTG=JKGalat/(p*(n-1))
F=KTP/KTG
Ftabel = qf(0.95, p-1,p*(n-1))
Pvalue = 1-pf(F, p-1,p*(n-1))
RSquare=100*(1-(JKGalat/JKTOTAL))
RSquareAdj=100*(1-((JKGalat/(p*n-p))/(JKTOTAL/(n*p-1))))






