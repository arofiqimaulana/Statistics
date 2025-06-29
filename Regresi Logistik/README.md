
# 📘 Regresi Logistik dalam Data Mining / Machine Learning

## Overview
Regresi logistik adalah algoritma dasar yang banyak digunakan dalam Data Mining dan Machine Learning, khususnya untuk masalah klasifikasi biner. Berbeda dengan regresi linier yang digunakan untuk memprediksi nilai kontinu, regresi logistik digunakan untuk memprediksi probabilitas dari hasil biner (misalnya, dua kelas yang mungkin seperti 0 atau 1, Benar atau Salah, Ya atau Tidak).

Ini adalah metode statistik yang menggunakan fungsi logistik untuk memodelkan variabel dependen biner.

## Fungsi Logistik (Sigmoid)
Regresi logistik menggunakan fungsi logistik (sigmoid) untuk memetakan output dari persamaan linier ke dalam rentang antara 0 dan 1. Fungsi ini didefinisikan sebagai:

$$
\sigma(z) = rac{1}{1 + e^{-z}}
$$

Dimana:
- \( z \) adalah kombinasi linier dari variabel input, biasanya diekspresikan sebagai \( z = b_0 + b_1 x_1 + b_2 x_2 + ... + b_n x_n \).
- \( e \) adalah basis dari logaritma natural.
- Output \( \sigma(z) \) adalah probabilitas yang diprediksi untuk kelas positif (biasanya "1").

## Formula untuk Regresi Logistik
Model regresi logistik memprediksi probabilitas dari kelas target (1) berdasarkan hubungan linier antara fitur input \( X \) dan koefisien bobot \( b \):

$$
P(y=1|X) = rac{1}{1 + e^{-(b_0 + b_1 x_1 + b_2 x_2 + ... + b_n x_n)}}
$$

Dimana:
- \( P(y=1|X) \) adalah probabilitas kelas menjadi 1.
- \( b_0, b_1, ..., b_n \) adalah koefisien model (bobot) yang dipelajari selama fase pelatihan.

## Langkah-langkah dalam Regresi Logistik
1. **Membangun Model**: 
   - Kami mulai dengan mengumpulkan data pelatihan dan mendefinisikan variabel independen (fitur) dan variabel dependen (target).
   
2. **Melatih Model**:
   - Model dilatih menggunakan algoritma optimasi (biasanya gradient descent) untuk meminimalkan fungsi biaya, yang sering kali berupa **log-likelihood** (atau **cross-entropy loss**).

3. **Prediksi**:
   - Setelah model dilatih, dapat digunakan untuk memprediksi probabilitas dari kelas target (1) untuk data baru.

4. **Batasan Keputusan**:
   - Sebuah threshold diterapkan pada probabilitas yang diprediksi untuk mengklasifikasikan input menjadi kelas 0 atau kelas 1. Threshold biasanya 0.5, tetapi dapat disesuaikan sesuai dengan masalahnya.

## Poin Penting dalam Regresi Logistik
- **Klasifikasi Biner**: Regresi logistik paling sering digunakan untuk tugas klasifikasi biner (misalnya, menentukan apakah sebuah email adalah spam atau bukan).
- **Interpretasi**: Model regresi logistik mudah untuk diinterpretasikan karena koefisien-koefisiennya menunjukkan hubungan antara setiap fitur dan hasilnya.
- **Output Probabilistik**: Output dari regresi logistik adalah probabilitas yang dapat dipetakan ke hasil biner (0 atau 1) dengan menggunakan threshold.
- **Asumsi**: Regresi logistik mengasumsikan hubungan linier antara variabel independen dan log-odds dari variabel dependen. Ini juga mengasumsikan bahwa observasi saling independen.

## Kelebihan Regresi Logistik
- Sederhana dan mudah diimplementasikan.
- Memberikan prediksi probabilistik, yang lebih berguna untuk pengambilan keputusan.
- Bekerja dengan baik untuk data yang terpisah secara linier.
- Lebih sedikit rentan terhadap overfitting dibandingkan dengan model yang lebih kompleks seperti pohon keputusan atau jaringan saraf ketika data kecil atau fitur sangat berkorelasi.

## Kekurangan Regresi Logistik
- Mengasumsikan hubungan linier antara fitur dan log-odds dari variabel dependen, yang mungkin tidak selalu benar.
- Tidak ideal untuk masalah yang lebih kompleks dengan batasan keputusan non-linier (misalnya, pengenalan gambar atau pengenalan suara).
- Sensitif terhadap dataset yang tidak seimbang. Dalam kasus di mana kelas sangat tidak seimbang, model ini mungkin tidak bekerja dengan baik tanpa teknik tambahan seperti oversampling atau regularisasi.

## Metrik Evaluasi
Setelah model regresi logistik dilatih dan prediksi dibuat, metrik berikut dapat digunakan untuk mengevaluasi kinerjanya:
- **Akurasi**: Proporsi prediksi yang benar.
- **Presisi**: Proporsi prediksi positif yang benar di antara semua prediksi positif.
- **Recall (Sensitivitas)**: Proporsi prediksi positif yang benar di antara semua instance positif yang sebenarnya.
- **F1-Score**: Rata-rata harmonik antara presisi dan recall, yang berguna ketika menangani kelas yang tidak seimbang.
- **ROC-AUC**: Mengukur area di bawah kurva karakteristik penerima operasi (ROC), representasi grafis dari trade-off antara true positive rate dan false positive rate.

## Contoh Kode dalam Python (Menggunakan Scikit-Learn)
```python
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# Data sampel
X = [[0, 1], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]
y = [0, 0, 0, 1, 1, 1]

# Membagi data menjadi train dan test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)

# Melatih model regresi logistik
model = LogisticRegression()
model.fit(X_train, y_train)

# Membuat prediksi
y_pred = model.predict(X_test)

# Evaluasi
print("Akurasi:", accuracy_score(y_test, y_pred))
print("Matriks Kebingungannya:
", confusion_matrix(y_test, y_pred))
print("Laporan Klasifikasi:
", classification_report(y_test, y_pred))
```

## Referensi:
- [Dokumentasi Regresi Logistik Scikit-learn](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html)
- [Regresi Logistik di Wikipedia](https://id.wikipedia.org/wiki/Regresi_logistik)
