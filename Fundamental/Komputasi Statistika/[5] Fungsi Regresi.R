# Diharapkan mengirim Laporan Praktikum ke arofiqimaulana@gmail.com dalam bentuk pdf
# options(digits=2) mengatur banyak digit desimal
# Penggunaan FALSE dan TRUE pada distribusi sebaran di R
# set.seed(1) agar random tidak berbeda tiap waktu
# Statement if dan else digunakan jika terdapat 2 atau lebih kondisi dengan penyesuaian tertentu
# Statement for untuk perulangan dengan banyak perulangan diketahui
# Statement while untuk perulangan dengan banyak perulangan tidak diketahui
# Perintah cat 
 datanormal=function(n=10,mean=15,ragam=9) {
	data=rnorm(n,mean,sqrt(ragam))
	cat("=======================\n")
	cat("List Data\n")
	cat("=======================\n")
	cat(data,sep="\n")
	cat("=====================\n")
	}
 datanormal()
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

data=read.table(file.choose(),header=T)
attach(data)

#Regresi Linier Y~X1 pendekatan non matriks
B=function(X,Y){
	(sum(X*Y)-(sum(X)*sum(Y))/length(X))/(sum(X*X)-length(X)*(mean(X)^2))
	}

B=function(X,Y){
	(sum(X*Y)-(sum(X)*sum(Y))/length(X))/(sum(X*X)-length(X)*(mean(X)^2))
	}
B(X1,Y)
A=function(X,Y){
	(mean(Y)-B(X,Y)*mean(X))
	}
A(X1,Y)

#Koefisien Regresi
coef(lm(Y~X1))

#Regresi Linier pendekatan matriks
X=cbind(seq(1),X1,X2)
Beta=function(X,Y){
	Beta=solve(t(X)%*%X)%*%t(X)%*%Y
}
Beta(X,Y)






