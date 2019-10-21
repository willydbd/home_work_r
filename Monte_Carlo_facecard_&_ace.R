##CREATE DECK OF CARDS
suits<-c("Diamonds","Clubs","Hearts","Spades")
aces<-paste("Ace",suits)
facecard<-c("Ten","Jack","Queen","King")
facecard<-expand.grid(number=facecard,suit=suits)
facecard<-paste(facecard$number,facecard$suit)
numbers<-c("Ace","Deuce","Three","Four","Five","Six","Seven","Eight",
           "Nine","Ten","Jack","Queen","King")
deck<-expand.grid(suit=suits,number=numbers)
deck<-paste(deck$number,deck$suit)

##NUMBERS MONTE CARLO REPETITIONS

B<-10000
results<-replicate(B,{
  hand<-sample(deck,2)
    (hand[1]%in%aces & hand[2]%in%facecard)|
    (hand[2]%in%aces & hand[1]%in%facecard)
})
mean(results)
