# TIME SERIES

Data time series adalah data yang dikumpulkan dari waktu ke waktu. Suatu data mungkin dikumpulkan dalam bentuk berbagai dimensi waktu seperti jam, harian, mingguan, bulanan, dan tahunan. Kadangkala kita punya ketertarikan untuk menganalisis data deret dan membuat ramalan terhadap beberapa periode ke depan.

```
Forecasting is a common data science task that helps organizations with capacity planning, goal setting, and anomaly detection. 
```

Analisis data deret waktu dapat digolongkan menjadi beberapa jenis yaitu
1. Univariate (tidak ada regresor)
2. Multivariate (menambahkan regresor)
3. Non-Linier 

Beberapa contoh metode yang dapat digunakan dalam analisis data deret waktu adalah
1. ARIMA (Autoregressive Integrated Moving Average)
2. Exponential Smoothing 
3. GARCH
4. Dekomposisi
5. VAR
6. STAR (Space Time Autoregressive)
7. Holt Winter
8. Fuzzy 

Tahapan dalam forecasting menurut Box & Jenkins (1976) adalah
1. model specification (or identification) -> looking at the data using time series plot, trend, seasonal, related with other field.
2. model fitting -> estimating parameters using MLE, OLS
3. model diagnostics ->  assessing the quality of the model using ACF Residual, AIC, MSE

# Taksonomi
![](images/classify.png)

# Forecasting Steps
![](images/flow.png)


## Refference
1. https://www.itl.nist.gov/div898/handbook/pmc/section4/pmc444.htm
2. https://homepage.univie.ac.at/robert.kunst/prognos3.pdf
3. https://www.stat.ipb.ac.id/en/uploads/RA/Time%20series/Kuliah%206%20-%20Metode%20Pemulusan%20Winter%20(Multiplikatif).pdf
4. https://otexts.com/fpp2/moving-averages.html
5. http://halweb.uc3m.es/esp/Personal/personas/jtena/eng/teaching_files/DOCTO6.pdf