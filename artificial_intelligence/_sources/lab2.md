---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---
# Lab 2: Supervised Learning

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Superwise learning at Wikipedia](https://en.wikipedia.org/wiki/Supervised_learning)
```
<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?si=tz_N9pPiNCKIk0zM&amp;list=PLOLWGEXpOrBzV-o9E1qWnisuxNJuePBEG" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

## Linear Regression

```{code-cell} ipython3
import numpy as np
from sklearn.linear_model import LinearRegression as lr
import pandas as pd
import matplotlib.pyplot as plt

samplesize = 100
b = [0.35,2.7]
x = np.random.normal(0, 1, samplesize)
error = np.random.normal(0, 1, samplesize)
y = b[0]+b[1]*np.array(x) + np.array(error)

plt.plot(x,y,'o')
plt.show()
```
```{code-cell}
LR = lr()
reg = LR.fit(x.reshape(-1, 1), y)
reg.score(x.reshape(-1, 1), y)
print("Coefficient: ", LR.coef_)
print("Intercept: ", LR.intercept_)
plt.plot(x,y,'o',color='red')
plt.plot(x, LR.coef_*x+LR.intercept_,color='blue')
plt.show
```

## Multivariate linear regression

```{code-cell} ipython3
from sklearn import datasets

# your example values:
m = 10000
n = 100
random_seed = 42 # for reproducibility, exact value does not matter

X, y, coef = datasets.make_regression(n_samples=m, n_features=n, n_informative=n, n_targets = 1, noise = 10, coef = True, random_state = random_seed)

y = y+6 #add intercept

print(coef)
```

```{code-cell}
reg = LR.fit(X, y)
print("Coefficient: ", LR.coef_)
print("Intercept: ", LR.intercept_)
```

## Classification by logistic model

```{code-cell} 
#import pandas
import pandas as pd
col_names = ['pregnant', 'glucose', 'bp', 'skin', 'insulin', 'bmi', 'pedigree', 'age', 'label']
# load dataset
pima = pd.read_csv("diabetes.csv", header=None, skiprows=1, names=col_names)
pima.head()
```

### Selecting Feature

```{code-cell}
#split dataset in features and target variable
feature_cols = ['pregnant', 'insulin', 'bmi', 'age','glucose','bp','pedigree']
X = pima[feature_cols] # Features
y = pima.label # Target variable

```

### Splitting Data
```{code-cell}
# split X and y into training and testing sets
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=16)

```

### Model Fit and Prediction
```{code-cell}
# import the class
from sklearn.linear_model import LogisticRegression

# instantiate the model (using the default parameters)
logreg = LogisticRegression(random_state=16)

# fit the model with data
logreg.fit(X_train, y_train)

y_pred = logreg.predict(X_test)

```

### Model Evaluation using Confusion Matrix
```{code-cell}
# import the metrics class
from sklearn import metrics

cnf_matrix = metrics.confusion_matrix(y_test, y_pred)
cnf_matrix

```

### Visualizing Confusion Matrix using Heatmap

```{code-cell}
# import required modules
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

class_names=[0,1] # name  of classes
fig, ax = plt.subplots()
tick_marks = np.arange(len(class_names))
plt.xticks(tick_marks, class_names)
plt.yticks(tick_marks, class_names)
# create heatmap
sns.heatmap(pd.DataFrame(cnf_matrix), annot=True, cmap="YlGnBu" ,fmt='g')
ax.xaxis.set_label_position("top")
plt.tight_layout()
plt.title('Confusion matrix', y=1.1)
plt.ylabel('Actual label')
plt.xlabel('Predicted label')

```

### Confusion Matrix Evaluation Metrics

```{code-cell}
from sklearn.metrics import classification_report
target_names = ['without diabetes', 'with diabetes']
print(classification_report(y_test, y_pred, target_names=target_names))
```

### ROC curve
```{code-cell}
y_pred_proba = logreg.predict_proba(X_test)[::,1]
fpr, tpr, _ = metrics.roc_curve(y_test,  y_pred_proba)
auc = metrics.roc_auc_score(y_test, y_pred_proba)
plt.plot(fpr,tpr,label="data 1, auc="+str(auc))
plt.legend(loc=4)
plt.show()
```