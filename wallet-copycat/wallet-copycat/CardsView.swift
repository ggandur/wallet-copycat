//
//  Home.swift
//  IOS-Wallet-Copycat
//
//  Created by Matheus Barbosa on 23/05/23.
//
import SwiftUI

struct CardsView: View {
    
    @Binding var cards: [Card]
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 0){
                    ForEach(cards){card in
                        CardView(card: card)
                    }
                }
            }
            .coordinateSpace(name: "SCROOL")
        }
        .padding(.horizontal)
    }
    
    //Card View
    @ViewBuilder
    func CardView(card: Card) -> some View{
        GeometryReader{proxy in
            
            let rect = proxy.frame(in: .named("SCROOL"))
            //Display some Portion of each Card
            let offset = -rect.minY + CGFloat(getIndex(Card: card) * 55)
            
            ZStack(alignment: .leading){
                NavigationLink(destination: DetailView(currentCard: card)){
                    Image(card.cardImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 220)
                }
                .offset(y: offset)
                
                //Details
                VStack(alignment: .leading){
                    HStack{
                        Text("﹒﹒﹒﹒﹒")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .tracking(-20)
                        Text(customCardNumber(number: card.cardNumber))
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }.padding(.top, 175)
                }
            }
        }// Max Size
        .frame(height: 220)
    }
    
    //Retreiving Index
    func getIndex(Card: Card) -> Int{
        return cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
}

//Hiding numbers
func customCardNumber(number: String) -> String{
    var newValue: String = ""
    let maxCount = number.count - 4
    
    number.enumerated().forEach{value in
        if value.offset >= maxCount{
            //displaying text
            let string = String(value.element)
            newValue.append(contentsOf: string)
        }
        else{
            //Displaying star
            //Avoiding space
            let string = String(value.element)
            if string == " " {
                newValue.append(contentsOf: "")
            }else{
                newValue.append(contentsOf: "")
            }
        }
    }
    
    return newValue
}
