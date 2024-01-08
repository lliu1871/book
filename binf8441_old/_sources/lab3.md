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


# Lab 3: The law of large numbers 


The law of large numbers states that as the sample size $n$ goes to infinity the sample average $\bar{X}$  converges to the true population mean $\mu$ , i.e., as $n\rightarrow \infty$ , $\bar{X}\rightarrow \mu$ . In this lab, we will simulate data to demonstrate the law of large numbers.


## A discrete case (Poisson distribution)

The population mean of the Poisson distribution $(\lambda=5)$ is $E(X)=\lambda=5$. We simulate $n=10$ observations from the Poisson distribution and calculate the sample average. 

```{code-cell}
n=10
data = rpois(n, lambda=5)

print(paste("the sample average is",mean(data)))
sd(data)
summary(data)
sort(data)
max(data)
min(data)
quantile(data, prob=0.95)

par(mfrow=c(2,2))
plot(data)
hist(data)
boxplot(data)
```

Then we increase the sample size $n$ from 100, 200, up to 100,000 and recalculate the sample average. By the law of large numbers, we expect that the sample average gets closer to the true population mean 5 as the sample size increases.

```{code-cell}
nsim = 1000
sample_size = (1:nsim)*100
sample_average = 1:nsim
for(i in 1:nsim){
	data = rpois(sample_size[i],lambda=5)
	sample_average[i] = mean(data)
}

plot(x=sample_size, y=sample_average,col='blue',pch=16)
abline(a=5,b=0,col='red')
```

## A continuous case (Normal distribution)

In this case, the population is a normal distribution with mean 2.7 and variance 1.6. We simulate data from $Normal(\mu=2.7, \sigma^2=1.6)$ and calculate the sample average.

```{code-cell}
n=10
data = rnorm(n, mean=2.7, sd=sqrt(1.6))

print(paste("the sample average is",mean(data)))
sd(data)
summary(data)
sort(data)
max(data)
min(data)
quantile(data, prob=0.95)

par(mfrow=c(2,2))
plot(data)
hist(data)
boxplot(data)
```
Then we increase the sample size $n$ from 100, 200, up to 100,000 and recalculate the sample average. By the law of large numbers, we expect that the sample average gets closer to the true population mean 2.7 as the sample size increases.

```{code-cell}
nsim = 1000
sample_size = (1:nsim)*100
sample_average = 1:nsim
for(i in 1:nsim){
	data = rnorm(sample_size[i],mean=2.7,sd=sqrt(1.6))
	sample_average[i] = mean(data)
}

plot(x=sample_size, y=sample_average,col='blue',pch=16)
abline(a=2.7,b=0,col='red')
```

## Exercise
Demonstrate the law of large numbers for the Binomial distribution, the Exponential distribution, and the Gamma distribution.