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


# Lab 1: Introduction to R 

Please read the document [R-intro.pdf](https://cran.r-project.org/manuals.html). In this lab, we will go through the following topics in R. 

- Getting help: google, manual, or ? 
- Numbers, vectors, and matrix, list 
- Math functions 
- String 
- Reading data from files 
- Generating random numbers 
- Loops  
- Writing your own functions 

## Installing R
Downloading R at https://cran.microsoft.com/ and following the instruction to install R on your computer. It is highly recommended to install RStudio available at https://posit.co/downloads/ and run R in RStudio. Alternatively, you may run R remotely at https://www.w3schools.com/r/r_intro.asp. 

## Getting help

- Google search "how to calculate average in R"
- Read the R manual
- Using ? in R

## Assignments 
We may use "=" or "<-" to assign values to variables. For example, we here generate a variable $x$ whose value is 3.
```{code-cell}
x <- 3 
x
```
We may generate a vector variable and use "[i]" to locate elements in the vector. 
```{code-cell}
x <- 2:5 
x
x[2]
```

We may generate a string variable which is a vector of characters
```{code-cell}
x <- "I am a student" 
x
x[3]
```

We may generate a matrix variable and use "[i,j]" to locate elements in the vector.
```{code-cell}
x <- matrix(1:12, nrow=3, ncol=4)
x
x[1,2]
x[1,]
x[,2]
```

A list variable may contain different types of data
```{code-cell}
x <- list() 
x[[1]] = "I am a student"
x[[2]] = 123
x
```

 

## Math functions 
```{code-cell}
x=1:3
x*4 
exp(x) 
log(x) 
x=matrix(1,3,3) 
y=matrix(2,3,3) 
x%*%y 
x*y 
```

## Functions for strings 

```{code-cell}
x= rep("",3) 
x[1]  = "I am a graduate student"
x[2] = "who am I?" 
x[3] = "who are you?" 

nchar(x[1]) 
substring(x[1],1,3) 
strsplit(x[2], split=" ") 
paste("a","hello",sep="") 
grep("who",x) 
gsub("graduate","undergraduate",x) 
toupper(x) 
tolower(x)
``` 

 

## Reading data from files 

```{code-cell}
data=read.csv("Lab 1 - data.csv") 
data
data[,1] = data[,1] * 10 
write.csv(data,"newdata.csv", row.names=F) 
```
 
## Flow control 

```{code-cell}
x=1 

y=2 

x==y 

x != y 

(x==1) || (y==2) 

(x==0) && (y==2) 
```
 

## Loops 
```{code-cell}
x = runif(10, min=0, max=1) 
x
sum=0 
for(i in 1:10){
    sum=sum+x[i]
} 
sum 
```

```{code-cell}
x = 1:10
product = 1 
for(i in 1:10){
    product=product*x[i] 
}
product 
```

```{code-cell}
x = c(5,3,7,2)
n = length(x) 

for(i in 1:(n-1)){ 
    for(j in i:n){ 
        if(x[i]>x[j]){ 
            y=x[i] 
            x[i]=x[j] 
            x[j]=y 
        } 
    } 
} 
x
```

## Constructing your own functions 

my_function_name = function(x, y, ...){ 

…. 

return(result) 

} 

```{code-cell}
my_sum = function(x){ 
    n = length(x)
    sum=0 
    for(i in 1:n){
        sum = sum + x[i] 
    } 
    sum 
}

x = 1:50
my_sum(x)
```
