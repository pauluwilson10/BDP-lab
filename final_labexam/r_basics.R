x<-1:10
y<-"1"
z<-as.numeric(y)
print(z)
print(x)

k<-as.integer(z)
print(k)


c1<-c(1,2,3)
c2<-c(4,5,6)
print(c1&c2)

z<-52.9494
if(is.numeric(z)){
  print("you are awesome!!!")
}

y<-c("hardwork","is","key","to","success")
if("key" %in% y){
  print("nice")
}


y<-"4"
x<-switch(y,"4"="ram","5"="shyam","6"="vivek")
print(x)


for(i in 1:10){
  paste(i)
}


f<-c("apple","mango","graps")
for(i in 1:length(f)){
  print(f[i])
}

x<-2
repeat{
  print("hello")
  x<-x+1
  if(x>5){
    break
  }
}



new<-function(r){
  name<-readline(prompt = "Enter your name: ")
  age<-readline(prompt="enter your age")
  cat("hello my naem is: ",name,r,"and my age is: ",age,"\n")
}
new(6)


x<--5
print(abs(x))
print(sqrt(4))

a<-"123456789"
substr(a,2,6)

s1<-"Manish Gelot"
print(tolower(s1))

s2<-c('abcd','d','bcaaedd')
x<-grep('bc',s2)
print(x)
result1<-x[2]
print(result1)




sentence<-"hello there are some problem"
word<-strsplit(sentence," ")[[1]]
for(i in 1:length(word)){
  if (i%%2==0){
    word[i]<-"two"
  }
}

new_sentence<-paste(word,collapse=" ")
print(new_sentence)


#vector
a<-1:6
a
sq<-seq(1,5,by=0.5)
sq

char<-c("shyam"=12,"ram"=13,"kalam"=15)
print(char[13])
c<-c(1,2,34,5)
c[2:4]



#list

l=rep(c(2,3,4),each=4)
print(l)

rep(1:4,length.out=7)

seq(from=3.5,to=1.5,by=-0.5)

x<-1:6
any(x>5)
all(x>10)

#array
v1<-c(1,2,3)
v2<-c(10,23,33)
v3<-array(c(v1,v2),dim=c(3,3,2))
print(v3)

col_name<-c("c1","c2","c3")
row_name<-c("r1","r2","r3")
mat_name<-c("mat1","mat2")
v3<-array(c(v1,v2),dim=c(3,3,2),dimnames = list(row_name,col_name,mat_name))
v3
#matrix
mat<-matrix(c(2:13),nrow=4,byrow=TRUE)
mat

row_name<-c("r1","r2","r3","r4")
col_names<-c("c1","c2","c3")
z<-matrix(c(7:18),nrow=4,byrow = TRUE,dimnames = list(row_name,col_names))
z

print(z[,2])
z[4,3]<-0
z[z==11]<-1000
print(z)

rbind(z,c(2,3,4,7))
cbind(z,c(1000,10001,10002,89))



#dataframe
emp_data<-data.frame(
  employee_id=c(1:3),
  employee_name=c("rame","mohan","sohan"),
  starting_date=c("2012-01-02","2013-09-23","2013-01-12"),
  stringsAsFactors = FALSE )
print(emp_data)
str(emp_data)
f1<-data.frame(emp_data$employee_name,emp_data$starting_date)
f1
f2<-emp_data[2:3,]
f2
f3<-emp_data[c(2,3),c(2,3)]
f3