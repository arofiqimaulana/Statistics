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
### 4. Distribusi Hipergeometri
### 5. Binomial Negatif
### 6. Distribusi Geometri
