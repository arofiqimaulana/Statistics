# Exponential Smoothing

## 1. Single Exponential Smoothing
Juga dikenal sebagai simple exponential smoothing yang digunakan untuk peramalan jangka pendek biasanya 1 periode ke depan. Model ini mengasumsikan bahwa data berfluktuasi  di sekitar rata-rata.

![](images/Single-Exponensial-Smoothing.png)

Dapat dilihat bahwa nilai smooth saat ini ditentukan oleh data aktual saat ini dan nilai smooth 1 periode sebelumnya. 

## 2. Double Exponential Smoothing
Metode ini digunakan ketika data mengandung pola trend. Pola trend digambarkan oleh komponen gamma. sesuai namanya, model ini mengandung dua parameter (double parameter)

![](images/Double-Exponensial-Smoothing.png)

## 3. Triple Exponential Smoothing
Metode ini (juga dikenal sebagai Holt-Winter) digunakan ketika data mengandung pola trend dan juga musiman. Model Holt-Winter terbagi menjadi dua bagian yaitu musiman additive dan musiman multiplikatif. 

![](images/Triple-Exponensial-Smoothing.png)

dimana
b1 = base signal (juga dikenal sebagai komponen permanen)
b2 = komponen trend linier
St = faktor musiman
et = komponen error

Sesuai dengan namanya, Untuk bagian musiman multiplikatif yaitu Xt ditentukan sebagai hasil perkalian St dengan t. Sedangkan pada bagian additive, nilai Xt merupakan fungsi penjumlahan dari St dan t.

## Refference
1. https://yintingchou.com/posts/2017-03-29-exponential-smoothing/