# ANALISIS SURVIVAL

### Definisi
sering disebut analisis time to event, analisis data yang berhubungan dengan waktu, mulai dari awal penelitian sampai terjadinya suatu peristiwa khusus (Colled, 2003). <br/>

Peristiwa khusus (failure event) tersebut dapat berupa kegagalan, kematian, kambuh atau sembuhnya dari suatu penyakit, respon dari suatu percobaan, atau peristiwa lain yang dipilih sesuai dengan kepentingan peneliti. <br/>

### Waktu Survival
adalah periode amatan berupa interval waktu antara permulaan pengamatan hingga terjadinya kejadian yang diamati.

### Fungsi Survival (S(t))
adalah peluang bahwa suatu objek/pasien akan survive dalam rentang waktu yang diberikan.

### Fungsi Hazard (h(t))
adalah laju kegagalan sesaat pada waktu t dengan syarat bahwa individu tersebut mampu bertahan sampai t. Fungsi hazard bisa berdistribusi konstan (uniform), Weibull, maupun lognormal.

### Log Rank Test
Digunakan untuk menguji apakah dua grup (misal gender) terdapat perbedaan survive yang signifikan.

### Kurva Kaplan Meiyer
adalah kurva yang menggambarkan banyaknya failure di setiap titik-titik waktu pengamatan.

### Sensor 
Data dikatakan tersensor apabila data tidak dapat diamati secara lengkap karena subjek penelitian hilang atau mengundurkan diri atau sampai akhir penelitian subjek tersebut belum mengalami kejadian tertentu.<br/>

Tiga jenis tipe sensoring adalah <br/>
1. Sensor Kanan <br/>
Sensor yang terjadi dikarenakan objek pengamatan belum mengalami kejadian hingga akhir periode pengamatan, sedangkan waktu awal dari objek pengamatan dapat diamati secara penuh.

Misalkan suatu individu diamati selama lima tahun dari awal pengamatan, kemudian pada tahun ketiga individu tersebut pindah ke negara lain dan tidak dapat diamati lagi (lost to follow up).<br/>

2. Sensor Kiri <br/>
Sensor yang terjadi dikarenakan waktu awal dari subjek pengamatan tidak dapat teramati pada awal pengamatan, sementara kegagalan dapat diamati secara penuh sebelum penelitian berakhir. 

Sebagai contoh, peneliti mengamati pasien penyakit kanker, peneliti dapat mencatat kejadian tepatnya seseorang tersebut positif kanker di tes pertamanya, namun peneliti tidak memiliki catatan tentang waktu tepatnya seseorang tersebut mulai berpenyakit kanker. 

3. Sensor Interval <br/>
Sensor interval adalah sensor yang waktu survivalnya berada dalam suatu selang tertentu. 
Subjek disebut tersensor-kiri (left-censored) jika kegagalan telah terjadi sebelum subjek memasuki studi, tetapi tidak diketahui secara tepat saat terjadinya. 

Sebagai contohnya, jika catatan medis menunjukkan bahwa pada usia 45 tahun pasien kanker dalam contoh di atas kondisinya sehat dan belum berpenyakit kanker, kemudian pasien melakukan tes pertama saat berumur 50 tahun dan terdiagnosis terkena penyakit kanker, dengan demikian usia saat didiagnosis positif kanker adalah antara 45 dan 50 tahun.


### Mode Cox Proportional Hazard
adalah model regresi yang digunakan untuk mengidentifikasi hubungan antara waktu survival dan satu atau lebih variabel prediktor. Jika Kurva kaplan meyer hanya bisa digunakan untuk variabel prediktor bersifat kategori, Model Cox PH memperbolehkan variabel prediktor bersifat kategori maupun kontinu.

### Suvreg vs Coxph
Model Coxph merupakan semi-parametrik model, artinya variabel waktu survival tidak diasumsikan berdistribusi tertentu. Sedangkan suvreg adalah model parametrik yang mengasumsikan bahwa waktu survival mengikuti distribusi tertentu.

### Concordance
merupakan suatu metrik untuk mengevaluasi prediksi. Concordance berkisar antara 0 dan 1. Jika Concordance = 0 maka prediksi salah semua, sedangkan Concordance = 1 maka prediksi sangat tepat. 


### Refference
1. Sthda (http://www.sthda.com/english/wiki/cox-proportional-hazards-model)
2. suvreg vs coxph (http://www.drizopoulos.com/courses/emc/ep03_%20survival%20analysis%20in%20r%20companion)
3. Concordance (https://medium.com/analytics-vidhya/concordance-index-72298c11eac7)
