exact_prob<-function(n){
  prob_unique<-seq(365,365-n+1)/365
  1-prod(prob_unique)
}
exact_prob(60)

n<-70
B<-10000
result<-replicate(B,{
  birthday<-sample(1:365,n,replace=T)
  any(duplicated(birthday))
})
mean(result)

