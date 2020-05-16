#Menentukan peubah dependen
dependen
function(Y){
    Y=t(t(Y))
}
#Menentukan peubah dependen
>independen=function(X){
    X=t(t(X))
  }
> file.choose()
> source("D:\\KULIAH\\SEMESTER 7\\ASISTEN KOMSTAT\\MATERI\\[5] Fungsi Regresi\\X.txt")
> source("D:\\KULIAH\\SEMESTER 7\\ASISTEN KOMSTAT\\MATERI\\[5] Fungsi Regresi\\Y.txt")
> data=read.table(file.choose(),header=T)
> attach(data)
> X2=independen(X2)
> X1=independen(X1)
> Y=dependen(Y)




