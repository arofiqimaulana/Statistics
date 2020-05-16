# ANALISIS SURVIVAL

### Definisi
analisis data yangberhubungan dengan waktu, mulai dari awal sampai terjadinya suatu peristiwa khusus (Colled, 2003). <br/>

Peristiwa khusus (failure event) tersebut dapat berupa kegagalan, kematian, kambuh atau sembuhnya dari suatu penyakit, respon dari suatu percobaan, atau peristiwa lain yang dipilih sesuai dengan kepentingan peneliti. <br/>

### Waktu Survival
adalah periode amatan berupa interval waktu antara permulaan pengamatan hingga terjadinya kejadian yang diamati.

### Sensor 
Data dikatakan tersensor apabila data tidak dapat diamati secara lengkap karena subjek penelitian hilang atau mengundurkan diri atau sampai akhir penelitian subjek tersebut belum mengalami kejadian tertentu. Penyebabnya adalah <br/>

1. Pada saat studi berakhir subjek belum mengalami kegagalan. 
2. Subjek mengundurkan diri dari penelitian dan tidak dapat diamati lebih lanjut (lost to follow-up; withdrawal). 
3. Subjek mengalami kegagalan lain yang menyebabkan pengamatan tidak dapat diteruskan (competing risk). 

Tiga jenis tipe sensoring adalah <br/>
1. Sensor Kanan <br/>
Sensor yang terjadi dikarenakan objek pengamatan belum mengalami kejadian hingga akhir periode pengamatan, sedangkan waktu awal dari objek pengamatan dapat diamati secara penuh. <br/>

Misalkan suatu individu diamati selama lima tahun dari awal pengamatan, kemudian pada tahun ketiga individu tersebut pindah ke negara lain dan tidak dapat diamati lagi (lost to follow up).<br/>

2. Sensor Kiri <br/>
Sensor yang terjadi dikarenakan waktu awal dari subjek pengamatan tidak dapat teramati pada awal pengamatan, sementara kegagalan dapat diamati secara penuh sebelum penelitian berakhir. <br/>

Sebagai contoh, peneliti mengamati pasien penyakit kanker, peneliti dapat mencatat kejadian tepatnya seseorang tersebut positif kanker di tes pertamanya, namun peneliti tidak memiliki catatan tentang waktu tepatnya seseorang tersebut mulai berpenyakit kanker. <br/>

3. Sensor Interval <br/>

Sensor interval adalah sensor yang waktu survivalnya berada dalam suatu selang tertentu. <br/>

Subjek disebut tersensor-kiri (left-censored) jika kegagalan telah terjadi sebelum subjek memasuki studi, tetapi tidak diketahui secara tepat saat terjadinya. <br>

Sebagai contohnya, jika catatan medis menunjukkan bahwa pada usia 45 tahun pasien kanker dalam contoh di atas kondisinya sehat dan belum berpenyakit kanker, kemudian pasien melakukan tes pertama saat berumur 50 tahun dan terdiagnosis terkena penyakit kanker, dengan demikian usia saat didiagnosis positif kanker adalah antara 45 dan 50 tahun. <br/>

### Truncate


### Mode Cox Proportional Hazard
