## Definisi

## Jenis Distribusi
### 1. Distribusi Normal
Distribusi peluang kontinu yang terpenting dalam seluruh bidang statistika adalah distribusi normal. Grafiknya disebut kurva normal, berbentuk seperti sebuah lonceng. Hampir semua karakteristik makhluk hidup berdistribusi normal, seperti tinggi tanaman, berat badan, IQ Score, Blood Pressure dan lainnya.

Fungsi kepadatan peluang peubah acak normal yaitu

$$ f(x;\mu ,\sigma) = \frac{1}{\sigma\sqrt{2\pi}} \exp\left( -\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^{2}\right) ; \  -\infty < x < \infty $$

### 2. Distribusi Gamma, Exponensial, Chi-Square
Meskipun distribusi normal dapat dipakai untuk memecahkan banyak masalah dalam bidang rekayasa dan ilmu, masih banyak sekali masalah yang memerlukan fungsi kepadatan peluang lainnya dan salah satunya adalah distribusi gamma

$$ \Gamma(\alpha)=\int_{0}^{\infty}{x^{\alpha-1}e^{-x}\ dx}\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \textrm{untuk} \ \alpha>0 $$

### 3. Distribusi Chi-Square
Bila sampel acak ukuran n diambil dari populasi normal dengan rata-rata μ dan ragam populasi σ², dan ragam sampel s²  dihitung, maka diperoleh suatu nilai statistik S².

Bila S² adalah ragam sampel acak berukuran n yang diambil dari populasi normal dengan ragam σ², maka peubah acak

$$ \chi^2=\frac{\left(n-1\right)S^2}{\sigma^2} $$

berdistribusi Chi-Square dengan derajat kebebasan v=n-1


### 4. Distribusi Gamma
Teknologi modern telah memungkinkan orang merancang banyak sistem yang rumit penggunaanya, atau barangkali keamanannya, bergantung pada keandalan berbagai komponen dalam sistem tersebut. Sebagai contoh, suatu sekring mungkin putus, tiang baja mungkin melengkung, atau alat pengindera panas tak bekerja.

Komponen yang sama dalam lingkungan yang sama akan rusak dalam waktu yang berlainnan dan tak dapat diramalkan. Waktu sampai rusak, dinyatakan sebagai dengan peubah acak kontinu T dengan fungsi padat peluang f(t). Salah satu distribusi yang telah banyak sekali dipakai untuk menangani masalah seperti keandalan dan uji umur adalah Distribusi Weibull.

### 5. Distribusi T
Jarang sekali orang begitu beruntung mengetahui ragam populasi yang ingin disampel secara acak. Untuk sampel ukuran n ≥ 30, taksiran σ² yang baik dapat diperoleh dengan menghitung S². Selama S² memberikan taksiran yang baik dan tidak berubah banyak dari sampel ke sampel, biasanya begitu bila n ≥ 30, maka distribusi statistik

$$ (\bar{X}-\mu)/(S/\sqrt n) $$

mendekati distribusi peubah normal baku Z.

Bila ukuran sampel kecil (n < 30), nilai S² berubah cukup besar dari sampel ke sampel dan distribusi peubah acak

$$ (\bar{X}-\mu)/(S/\sqrt n) $$

tidak lagi distribusi normal baku. Dalam hal seperti ini kita menghadapi distribusi statistik yang akan disebut T,

$$ T=\frac{\bar{X}-\mu}{S/\sqrt n} $$

Distribusi sampel T didapat dari anggapan bahwa sampel acak berasal dari populasi normal. Jadi dapat ditulis

$$ T=\frac{(\bar{X}-\mu)(\sigma/\sqrt n)}{\sqrt{S^2/\sigma^2}}=\frac{Z}{\sqrt{V(n-1)}} $$

dengan $$ Z=\frac{\bar{X}-\mu}{\sigma/\sqrt n}\ \ \ ;\ \ \ V\ =\ \frac{(n-1)S^2}{\sigma^2} $$

Jika Z adalah peubah acak normal baku dan V adalah peubah acak Chi-Square dengan derajat kebebasan v. Jika Z dan V bebas, maka distribusi peubah acak T adalah

$$ T=\frac{Z}{\sqrt{V/v}} $$


### 6. Distribusi F
Salah satu distribusi yang terpenting dalam statistika terapan adalah distribusi F. Statistik F didefinisikan sebagai perbandingan dua peubah acak Chi-Square yang saling bebas, masing-masing dibagi dengan derajat kebebasannya. Jadi dapat ditulis

$$ F=\frac{U/v_1}{V/v_2} $$

dimana U dan V menyatakan peubah acak bebas, masing-masing berdistribusi Chi-Square dengan derajat kebebasan v1 dan v2.

Distribusi F juga dapat ditrurunkan dari sebaran sebaran normal yaitu

$$ F=\frac{S_1^2/\sigma_1^2}{S_2^2/\sigma_2^2}  $$

## Reference
- Introduction to Statistics, Ronald E. Walpole
- https://arofiqimaulana.com/distribusi-peluang-kontinu/