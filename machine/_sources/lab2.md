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


# Lab 2: Supervised Learning


## Linear Regression

```{code-cell}
b = c(0.35,2.7)
x = rnorm(50)
error = rnorm(50,mean=0,sd=1)
y = b[1]+b[2]*x + error

data = data.frame(cbind(y,x))

plot(data$x,data$y,col="blue")

result = lm(data$y~data$x)
result

abline(result$coef,col="red")
```

## Multivariate linear regression

```{code-cell}
:tags: ["hide-output"]

x = matrix(rnorm(30),nrow=10,ncol=3)
b = c(0.5,2.1,-0.9,1.4)
error = rnorm(30,mean=0,sd=1)
y = b[1]+b[2]*x[,1]+b[3]*x[,2]+b[4]*x[,3]+error

data = data.frame(y,x)
data
pairs(data)

result = lm(data$y ~ data$X1 + data$X2 + data$X3)
result
```



## Classification by logistic model

```{code-cell}
x = rnorm(100)
b = c(0.5, 0.9)
error = rnorm(100,mean=0,sd=1)
y = b[1]+b[2]*x+error
p = exp(y)/(1+exp(y))
group1 = which(p>0.5)
group2 = which(p<=0.5)
y[group1] = 1
y[group2] = 0

result = glm(y~x, family="binomial")

y_hat = result$coef[1]+result$coef[1]*x
p_hat = exp(y_hat)/(1+exp(y_hat))

print("estimated group1")
which(p_hat>0.5)

print("true group1")
group1
```