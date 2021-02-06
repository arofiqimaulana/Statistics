#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import numpy as np
from datetime import datetime, timedelta, date, timezone
from fbprophet.plot import plot_plotly
import matplotlib.pyplot as plt
import plotly.offline as py
import seaborn as sns
import plotly.express as px
py.init_notebook_mode()
get_ipython().run_line_magic('matplotlib', 'inline')


# In[ ]:


def configure_plotly_browser_state():
  import IPython
  display(IPython.core.display.HTML('''
        <script src="/static/components/requirejs/require.js"></script>
        <script>
          requirejs.config({
            paths: {
              base: '/static/base',
              plotly: 'https://cdn.plot.ly/plotly-1.5.1.min.js?noext',
            },
          });
        </script>
        '''))


# In[ ]:


from scipy import stats

from fbprophet import Prophet
import logging
logging.getLogger().setLevel(logging.ERROR)

import matplotlib.pyplot as plt
import datetime as dt
import io

import plotly as py
from plotly.offline import iplot, init_notebook_mode
import plotly.graph_objs as go

from sklearn.metrics import mean_squared_error, mean_absolute_error


# # 1. IMPORT DATA

# In[5]:


df = pd.read_excel('Average Land Temperature.xlsx')


# In[6]:


df.head()


# # 2. DATA CLEANING
# Data Cleaning berfungsi untuk membuat format data sesuai dengan yang diminta oleh agar bisa di run oleh python. Data LandAverageTemperature ini ternyata kolom time series nya terdiri dari dua format string dan date, sehingga perlu dilakukan cleaning data. 
# 1. Tipe data di kolom date tidak seragam (string dan date)
# 2. Check Null Data
# 3. Check Complete Series
# 4. Check Double Time Values

# ### 2.1 Menyeragamkan tipe data di kolom dt

# In[7]:


def getTime(dt):
    value = []
    if type(dt) == str:
        value =  dt[0:7]
    else:
        value =  dt.strftime("%Y-%m")
    return pd.to_datetime(value)


# In[8]:


df['dt'] = df['dt'].apply(getTime)


# In[9]:


df.info()


# ### 2.2 Chek Null data

# In[10]:


df.isnull().sum()


# In[11]:


df[df['LandAverageTemperature'].isnull()]


# In[ ]:





# ### 2.2 Chek Double Value di kolom dt

# In[12]:


df.duplicated(['dt'])


# In[13]:


duplicateRow = df[df.duplicated(['dt'])]
duplicateRow


# In[14]:


print(duplicateRow)


# In[15]:


duplicateRow.to_excel('duplicateRow.xlsx')


# In[16]:


len(df['dt'])/12


# Dapat disimpulkan bahwa terdapat data double di kolom dt (terdapat 2 bulan yang sama), oleh karena itu kolom dt akan direkonstruksi ulang menjadi satu series yang komplit.

# In[ ]:





# ###  2.3 PLOT DATA

# In[17]:


## Plot data bisa menunjukkan double value dan apakah series yang kita miliki complete series atau tidak
fig = px.line(df, x='dt', y='LandAverageTemperature')
fig.show()


# ### 2.4 Mengatasi Double Value dengan cara rekonstruksi kolom dt

# karena panjang series = 3192 dan 3192/12 = 266 (bilangan bulat), maka kolom dt akan di rekonstruksi ulang. Nilai null akan digantikan dengan data average

# In[18]:


df.head()


# In[19]:


df2 = df.copy()


# In[20]:


df2['dt'] = pd.date_range(start='1/1/1750',periods=3192,freq='M')


# In[21]:


df2.head()


# In[22]:


fig = px.line(df2, x='dt', y='LandAverageTemperature')
fig.show()


# In[23]:


duplicateRow = df2[df2.duplicated(['dt'])]
duplicateRow


# NOTE  : Dapat dilihat bahwa kita sudah tidak memiliki pengamatan yang double

# ### 2.5 Mengatasi nilai null 

# In[24]:


df2[df2['LandAverageTemperature'].isnull()]


# In[25]:


df3 = df2.copy()
df3['LandAverageTemperature'] = pd.to_numeric(df3['LandAverageTemperature'],errors='coerce')


# In[26]:


df3.info()


# In[27]:


df3 = df3.set_index('dt')


# In[28]:


df3.interpolate(inplace=True)


# In[29]:


df3[df3['LandAverageTemperature'].isnull()]


# In[ ]:





# ### 2.6 Plot Data Final

# In[30]:


df4 = df3.copy()


# In[31]:


## Mengubah index ke kolom
df4.reset_index(level=0, inplace=True)


# In[32]:


fig = px.line(df4, x='dt', y='LandAverageTemperature')
fig.show()


# In[ ]:





# ## 3. TIME SERIES ANALYSIS

# ### 3.1 Pembentukan Model

# In[33]:


# Mengubah nama kolom
df4.columns = ['ds', 'y']
df4.tail()


# In[34]:


# We will split the dataset to measure the performance later
n_pred = 30
train_df = df4[:-n_pred]
train_df.tail(5)


# In[92]:


# Instatiate the Prophet model object
# Fit the training data into prophet model
# First attempt we will use default parameters

prophet_basic = Prophet(weekly_seasonality=True,
                       daily_seasonality=True)
prophet_basic.fit(train_df)


# ### 3.2 Peramalan

# In[93]:


future = prophet_basic.make_future_dataframe(freq="M",periods=n_pred)
future.tail(5)


# In[94]:


forecast =  prophet_basic.predict(future)
forecast.tail(5)


# In[95]:


prophet_basic.plot(forecast)


# In[96]:


# We want to observe how's the component
# for each level of forecast
prophet_basic.plot_components(forecast)


# ### 3.3 Performa Model

# In[97]:


def result_comparison(historical, forecast):
  """
  Joining our actual data and forecasted data
  to see the gap between those two
  """
  return forecast.set_index('ds')[['yhat', 'yhat_lower', 'yhat_upper']].join(historical.set_index('ds'))


# In[98]:


comparison_df = result_comparison(df4,forecast)
comparison_df.tail(10)


# In[99]:


configure_plotly_browser_state()
init_notebook_mode(connected=False)

py.offline.iplot([
    go.Scatter(x=train_df['ds'], y=train_df['y'], name='y'),
    go.Scatter(x=forecast['ds'], y=forecast['yhat'], name='yhat'),
    go.Scatter(x=forecast['ds'], y=forecast['yhat_upper'], fill='tonexty', mode='none', name='upper'),
    go.Scatter(x=forecast['ds'], y=forecast['yhat_lower'], fill='tonexty', mode='none', name='lower')
])


# In[100]:


print("MAE yhat\t: {}\nMAE yhat_lower: {}\nMAE yhat_upper: {}".format(
    mean_absolute_error(comparison_df['y'].values, comparison_df['yhat']),
    mean_absolute_error(comparison_df['y'].values, comparison_df['yhat_lower']),
    mean_absolute_error(comparison_df['y'].values, comparison_df['yhat_upper'])))


# ## 4. PARAMETER TUNING

# In[53]:


train_df2 = train_df.copy().reset_index()


# In[54]:


train_df2.head()


# In[66]:


# by default prophet would create changepoints for 25 datapoints
# within range of 80% of the initial datapoints
# so in this section we would try to create our own changepoints
# we will create changepoints by defining all the datapoints outside IQR as chagepoints

def create_changepoints(df):
  q1 = df['y'].quantile(0.25)
  q3 = df['y'].quantile(0.75)
  iqr = q3 - q1
  UCL = q1 - (1.5 * iqr)
  LCL = q3 + (1.5 * iqr)
  return df[(df['y'] < UCL) | (df['y'] > LCL )]


# In[70]:


# print the changepoints
changepoints_df = create_changepoints(train_df2)
changepoints_df.head()


# In[91]:


### There is no changepoint


# In[87]:


## creating new model of Prophet
model_prophet_2 = Prophet(growth= 'linear', 
                           seasonality_mode = 'additive',
                           #changepoints= changepoints_df['ds'],
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


# In[82]:


# create future dataframe with N size of datapoints
future_2 = model_prophet_2.make_future_dataframe(periods=n_pred,freq="M")
future_2.tail(3)


# In[83]:


# predicting
forecast_2 = model_prophet_2.predict(future_2)
forecast_2.tail(5)


# ### Model Performance After Tunning

# In[84]:


# stitch the predicted value with actual value 
# after we made a lil bit of changes on the parameters
comparison_df_2 = result_comparison(df4, forecast_2)
comparison_df_2.tail(5)


# In[85]:


# Print the evaluation metrics for the predicted value
print("MAE yhat\t: {}".format(
    mean_absolute_error(comparison_df_2['y'].values, comparison_df_2['yhat'])))


# In[ ]:





# ## 5.TRANSFORMASI BOX COX

# In[88]:


# create function to inverse the transformed value
# we will use this function later to inverse the value
# after transformed using Box Cox

def inverse_box_cox(y, lambda_):
  return np.exp(y) if lambda_ == 0 else np.exp(np.log(lambda_ * y + 1) / lambda_)


# In[89]:


# tranformed the copied dataset on the section 2
boxcox_df = train_df2.copy().set_index('ds')
boxcox_df.head(3)


# In[90]:


# BoxCox transformed data
boxcox_df['y'], lambda_prophet = stats.boxcox(boxcox_df['y'])
boxcox_df.reset_index(inplace=True)


# ## 6. CONCLUSION

# 1. Changepoint dari Data Average Land Temperature tidak bisa didapatkan karena tidak ada data di dalam range yang dimaksud
# 2. Penggunaan Transformasi Box-Cox tidak dapat digunakan karena terdapat nilai yang negative (namun sebenarnya hal ini bisa diakali dengan menambahkan suatu bilangan konstan yang membuat semua data bernilai positif)
# 3. Oleh karena itu digunakan hasil peramalan model pertama (karena MAE lebih kecil)
# 4. Model masih memiliki nilai MAE yang besar

# In[101]:


print("MAE yhat\t: {}\nMAE yhat_lower: {}\nMAE yhat_upper: {}".format(
    mean_absolute_error(comparison_df['y'].values, comparison_df['yhat']),
    mean_absolute_error(comparison_df['y'].values, comparison_df['yhat_lower']),
    mean_absolute_error(comparison_df['y'].values, comparison_df['yhat_upper'])))


# In[ ]:





# ### REFFRENCE
# 1. https://chrisalbon.com/machine_learning/preprocessing_dates_and_times/handling_missing_values_in_time_series/
# 2. https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.to_numeric.html
# 3. https://plotly.com/python/time-series/
# 4. https://facebook.github.io/prophet/docs/non-daily_data.html
