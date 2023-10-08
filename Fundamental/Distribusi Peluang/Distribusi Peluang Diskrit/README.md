## Definisi

## Jenis Distribusi
### 1. Distribusi Bernouli
Percobaan Bernouli menghasilkan **dua kemungkinan hasil yaitu sukses dan gagal**. Percobaan ini hanya dilakukan 1 kali tindakan saja. Bisa dikatakan bawa **Bernouli adalah Binomial saat n=1** Contohnya yaitu pada kasus pelemparan mata uang koin. Percobaan tersebut akan menghasilkan dua buah kemungkinan yaitu angka dan gambar. Sehingga bentuk distribusi peluang bernouli adalah

$$ P(X=k) = p^k \cdot (1-p)^{1-k} \quad \text{untuk } k \in \{0,1\} $$

dimana

$$ p  = \text{peluang sukses} $$

$$ k  = \text{banyaknya tindakan sukses} $$

$$ E[X] = p $$ 

$$ \text{Var}[X] = p \cdot (1-p) $$

### 2. Distribusi Binomial
Distribusi binomial dapat dikatakan sebagai **percobaan bernouli** yang yang dilakukan **lebih dari 1 kali**. Secara singkat, jika pelemparan koin dilakukan 1 kali, maka dia termasuk percobaan bernouli. Namun, jika pelemparan koin dilakukan 2 kali atau lebih, maka dia masuk dalam percobaan Binomial. Maka tidak heran fungsi peluangnya mirip dengan distribusi bernouli.

$$ P(X = k) = \binom{n}{k} \cdot p^k \cdot (1-p)^{n-k} $$

dimana

$$ k = \text{banyaknya tindakan sukses} $$

$$ n = \text{banyaknya tindakan (sukses+gagal)} $$

$$ p = \text{peluang sukses} $$

$$ E[X] = np $$

$$ \text{Var}[X] = np(1-p) $$

### 3. Distribusi Poisson
Percobaan Poisson menghasilkan **banyaknya sukses yang terjadi dalam suatu waktu atau wilayah tertentu**. Contohnya adalah banyaknya kendaraan yang melintas di jalan Soekarno-Hatta selama 1 jam. 

Percobaan Poisson dapat dipandang sebagai percobaan Binomial jika n sangat besar. Fungsi peluang distribusi Poisson digambarkan sebagai

$$ P(X=k) = \frac{{e^{-\lambda} \cdot \lambda^k}}{{k!}} $$

dimana

$$ λ : \text{rata-rata banyaknya kejadian sukses selama selang waktu atau wilayah tertentu} $$

$$ k : \text{banyaknya kejadian sukses} $$

$$ E[X] = \lambda $$

$$ \text{Var}[X] = \lambda $$

### 4. Distribusi Hipergeometri
Distribusi ini menyatakan peluang terjadinya k sukses yang terambil dari dari n pengambilan dari populasi berukuran N, dimana ada K sukses di dalam populasi tersebut. 

Sehingga fungsi peluang untuk distribusi hipergeometri menggunakan konsep kombinasi.

$$ P(X=k) = \frac{{\binom{K}{k} \binom{N-K}{n-k}}}{{\binom{N}{n}}} $$

dimana

$$ k = \text{banyaknya sukses dari dari suatu pengambilan} $$

$$ n = \text{banyaknya pengambilan} $$

$$ K = \text{banyaknya sukses yang berada di Populasi} $$

$$ N = \text{Ukuran populasi} $$

### 5. Binomial Negatif
Distribusi binomial negatif merupakan banyaknya usaha yang dilakukan **sampai didapatkan k sukses**. Sama halnya dengan percobaan bernouli yang dilakukan berulang kali sampai didapatkan k sukses. 

Contohnya adalah banyaknya bohlam yang harus diperiksa sampai ditemukan 5 buah bohlam mati (k=5). Fungsi peluangnya adalah 

$$ P(X = k) = \binom{k-1}{r-1} \cdot p^r \cdot (1-p)^{k-r} $$

dimana

$$ k = \text{banyaknya sukses} $$

$$ x = \text{banyaknya tindakan/percobaan} $$

$$ E[X] = \frac{r}{p} $$

$$ \text{Var}[X] = \frac{r \cdot (1-p)}{p^2} $$

### 6. Distribusi Geometri
Distribusi ini menyatakan banyaknya usaha yang harus dilakukan untuk mendapatkan sukses pertama. Dengan kata lain, percobaan bernouli yang diulang berkali-kali sampai didapatkan sukses yang pertama. 

Bisa dibilang juga bahwa distribusi geometri = distribusi binomial negatif saat k = 1. maka fungsi peluang distribusi geometri adalah

$$ P(X = k) = (1-p)^{k-1}p $$

dimana

$$ p  = \text{peluang sukses} $$

$$ k  = \text{banyaknya tindakan sukses} $$

$$ E[X] = \frac{1}{p} $$

$$ \text{Var}[X] = \frac{1-p}{p^2} $$


## Reference
- https://repository.unikom.ac.id/66709/1/BAB%208%20Macam-macam%20distribusi.pdf
