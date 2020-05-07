 #Vector
 a=c(1,2,5.5,4)
 b = c("aku","kamu","dia")
 #membangkitkan matriks 5x4
 y=matrix(1:20,nrow=5,ncol=4)
 x=1:15
 #matrix per kolom
 mx=matrix(x,nrow=5)
 mx
 #matrix per baris
 mx=matrix(x,nrow=5,byrow=T)
 mx[1,]
 mx[1,3]
 #Penggabungan dua vektor
 x = c(1,2,3)
 y = c(3,4,5)
 m1=cbind(x,y)
 m2=rbind(x,y)
#Membut matrix dan convert ke data frame
 m=matrix(c(1,3,5,7,2,3),nrow=3,ncol=2,byrow=T)
 m1 = as.data.frame(m)
 attach(m1)
 V1
 m2 = as.matrix(m)
 #eigen value
 mp <- matrix(c(0,1/4,1/4,3/4,0,1/4,1/4,3/4,1/2),3,3,byrow=T)
 eigen(mp)$vector
 a= eigen(mp)$vectors
 a[1,1]^2+a[2,1]^2+a[3,1]^2
 