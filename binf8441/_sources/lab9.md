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
  display_name: R
  language: R
  name: ir
---


# Lab 9: Linear regression


## Simple linear regression

### Simulating linear regression data
```{code-cell}
x = rnorm(100, mean=3, sd=1)
error = rnorm(100, mean=0, sd=2)
y = 2.1+1.25*x+error

data=data.frame(cbind(x,y))
```
### Fitting the linear regression model
```{code-cell}
result = lm(data$y~data$x)
summary(result)
```

### Residual plot 
```{code-cell}
par(mfrow=c(2,2))
plot(x,y,pch=16)
abline(result,col="brown")
plot(result$residuals)
abline(a=0,b=0, col="brown")
hist(result$residuals)
qqnorm(result$residuals, pch=16)
qqline(result$residuals, col = "brown")
```

### Checking normality
```{code-cell}
shapiro.test(result$residuals)
```

### Prediction for new observations
```{code-cell}
x_new = 0.7
y_new = result$coefficients[1]+result$coefficients[2]*x_new
y_new
```

### Fitting quadratic relationships
```{code-cell}
x = rnorm(100, mean=0, sd=1)
y = 2.1+1.25*x^2+error
data=data.frame(cbind(x,y))
result = lm(data$y~data$x)
summary(result)
```

## Multiple linear regression
### Generating data
```{code-cell}
x1 = rnorm(100, mean=3, sd=1)
x2 = rnorm(100, mean=2.5, sd=2.1)

error = rnorm(100, mean=0, sd=2)
y = 2.1 + 1.25*x1 - 3*x2 + error

data=data.frame(cbind(y,x1,x2))
plot(data)
```
### Fitting the model
```{code-cell}
result = lm(y~x1+x2,data=data)
summary(result)
```

### Residual plot 
```{code-cell}
par(mfrow=c(2,2))
plot(result$residuals)
abline(a=0,b=0, col="red")
hist(result$residuals)
qqnorm(result$residuals, pch=16)
qqline(result$residuals, col = "brown")
```

### Checking the normality assumption
```{code-cell}
shapiro.test(result$residuals)
```

## Logistic regression
### Generating data
```{code-cell}
age <- round(runif(100, 18, 80))
log_odds = -2.2 + 0.02*age
p = 1/(1 + exp(-log_odds))
y <- rbinom(n = 100, size = 1, prob = p)
```

### Fitting the logistic model
```{code-cell}
mod <- glm(y ~ age, family = "binomial")
summary(mod)
```