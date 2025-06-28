
# 📘 Analisis Regresi Linier

Analisis regresi merupakan analisis data yang bertujuan untuk memodelkan hubungan antara variabel dependen dan variabel independen. Jika skala pengukuran variabel dependen adalah nominal dan ordinal, maka analisis tersebut akan menggunakan **regresi logistik**. Model regresi linier dapat digambarkan sebagai berikut:

```
y = a * X1 + b * X2 + c * X3 + error
```

Tujuan dari analisis ini adalah untuk menemukan konstanta **a**, **b**, dan **c** sedemikian hingga variabel error sekecil mungkin. Beberapa metode yang dapat digunakan untuk mendapatkan konstanta-konstanta tersebut antara lain **OLS (Ordinary Least Square)** dan **Maximum Likelihood**. Lalu, pertanyaannya adalah, penduga manakah yang paling baik?

Menurut **Teorema Gauss-Markov**, penduga OLS (Ordinary Least Square), atau juga disebut **MKT (Metode Kuadrat Terkecil)**, akan menjadi penduga terbaik di antara semua penduga jika memenuhi beberapa asumsi berikut:

---

## 📋 Asumsi-asumsi Model Regresi Linier

1. **Hubungan antara variabel respon dan variabel prediktor adalah linier dalam parameter**  
   Maksudnya adalah model regresi yang memiliki bentuk fungsional parameter yang linier atau masih dapat dilinierkan.

2. **Variabel prediktor adalah variabel non-stokastik yang nilainya tetap**  
   Jika ternyata stokastik, maka variabel tersebut harus bebas terhadap sisaan. Artinya, nilai pengamatan pada saat t tidak dipengaruhi oleh periode yang lainnya (asumsi ini sulit dipenuhi pada data deret waktu).

3. **Nilai harapan (expected value) atau rata-rata sisaan 𝜖𝑖 adalah nol**  
   𝐸(𝜖𝑖 |𝑋) = 0  
   Asumsi ini berimplikasi bahwa tidak ada bias spesifikasi dalam model pada suatu analisis empiris.

4. **Varians dari sisaan 𝜖𝑖 adalah sama (homoskedastisitas)**  
   𝑉𝑎𝑟(𝜖𝑖|𝑋) = 𝜎

5. **Tidak ada korelasi serial (non-autokorelasi) antar sisaan**  
   𝐶𝑜𝑣(𝜖𝑖, 𝜖𝑗|𝑋𝑖, 𝑋𝑗) = 0 untuk 𝑖 ≠ 𝑗  
   Artinya, kesalahan pengukuran tidak terjadi karena pengaruh kesalahan pengukuran yang sebelumnya.

6. **Sisaan 𝜖𝑖 berdistribusi normal**  
   𝜖𝑖 ~ 𝑁(0, 𝜎²)

7. **Tidak ada multikolinieritas di antara variabel prediktor**  
   Dalam analisis regresi linier berganda, tidak boleh terdapat hubungan yang erat antar variabel prediktor (non-multikolinieritas).

---

## 🛠️ Pengujian Asumsi Regresi Linier Berganda

Dalam analisis regresi berganda, biasanya pengujian hanya dilakukan terhadap empat asumsi utama, yaitu:

1. **Normalitas Sisaan**  
   Sisaan harus berdistribusi normal. Teknik pengujian yang dapat digunakan adalah:
   - Kolmogorov-Smirnov
   - Jarque-Bera

2. **Non-Multikolinieritas**  
   Tidak boleh terjadi hubungan antar variabel independen. Teknik pengujian yang dapat digunakan adalah:
   - **VIF (Variance Inflation Factor)**

3. **Homoskedastisitas (Homogenitas Ragam Sisaan)**  
   Ragam sisaan harus konstan. Teknik pengujian yang dapat digunakan adalah:
   - Uji Breusch-Pagan
   - Uji Park
   - Uji Glejser
   - Uji White

4. **Non-Autokorelasi**  
   Tidak boleh terjadi korelasi antar sisaan. Teknik pengujian yang dapat digunakan adalah:
   - Uji Durbin-Watson

---

## 📚 Referensi Belajar

- [Coursera - Regression Analysis](https://www.coursera.org/learn/regression-analysis)
- [Scikit-Learn - Linear Regression](https://scikit-learn.org/stable/modules/linear_model.html#linear-regression)
- [Statistical Methods for Regression](https://www.statistics.com/)
