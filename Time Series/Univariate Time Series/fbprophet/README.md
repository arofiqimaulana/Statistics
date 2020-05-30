# Forecasting using fbprophet
fbprophet merupakan salah satu alat forecasting yang dikembangkan oleh facebook. Metode ini membantu Facebook untuk planning dan goal setting. Konsep dasar dari metode ini dengan cara mem-breakdown time series data berdasarkan komponen additive/multiplikatif, trend, musiman harian/bulanan/tahunan, dan efek liburan.

Metode ini juga memungkinan pengguna untuk tunning parameter sendiri berdasarkan domain knowledge yang dimiliki. fbprophet ini sangat kuat digunakan terhadap data deret waktu yang memiliki efek musiman, dan robust terhadap missing value, shifts in the trend maupun outlier.


### Fit Model
`
model_prophet_2 = Prophet(growth= 'linear', 
                           seasonality_mode = 'additive',
                           changepoints= changepoints_df['ds'],
                           daily_seasonality= True,
                           weekly_seasonality= True,
                           yearly_seasonality= True).add_seasonality(
                               name='monthly',
                               period=30.5,
                               fourier_order=15,
                               prior_scale=15
                           ).add_seasonality(
                               name='weekly',
                               period=7,
                               fourier_order=10,
                               prior_scale=20
                           ).add_seasonality(
                               name='yearly',
                               period=365.25,
                               fourier_order=20
                           ).add_seasonality(
                               name='quarterly',
                               period=365.25/4,
                               fourier_order=5,
                               prior_scale=15
                           )
model_prophet_2.fit(train_df2)
`

## Source
https://facebook.github.io/prophet/

