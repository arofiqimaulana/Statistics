### Metode Bayesian
Menurut Ntzoufras (2009) perbedaan utama metode klasik dan Bayesian yaitu parameter diperlakukan sebagai peubah acak yang ditandai oleh distribusi prior. Karakteristik dasar metode Bayesian yaitu penggunaan peluang untuk mengukur ketidakpastian suatu penduga parameter (Gelman dkk, 2003).  Tujuan utama penerapan metode Bayesian adalah mendapatkan distribusi posterior yang merupakan perkalian antara distribusi prior dan fungsi likelihood. 

### Markov Chain Monte Carlo
Tujuan utama penggunaan metode Bayesian adalah untuk mendapatkan distribusi posterior. Namun, distribusi posterior tidak mudah didapatkan karena mempunyai bentuk yang sangat kompleks, sehingga tidak dapat diselesaikan secara analitik. Oleh karena itu, dikembangkan teknik simulasi MCMC. 

### Gibbs Sampling
Gibbs sampling merupakan algoritma dalam metode MCMC yang digunakan untuk pengambilan sampel distribusi kompleks berdimensi tinggi. Gibbs sampling menggunakan sampel sebelumnya untuk membangkitkan nilai sampel berikutnya secara acak sehingga didapatkan rantai Markov (Walsh, 2004). Gibbs sampling menggunakan distribusi bersyarat penuh yang dihubungkan dengan distribusi posterior.

### Pemeriksaan Konvergensi Algoritma
Pemeriksaan konvergensi MCMC digunakan untuk mengetahui apakah sampel yang dibangkitkan sesuai dengan distribusi target yakni distribusi posterior. Pemeriksaan konvergensi MCMC dapat menggunakan trace plot, MC Error dan autokorelasi.

Output traceplot dan autokorelasi seperti berikut

![](images/BayesianZIG.png)


 

