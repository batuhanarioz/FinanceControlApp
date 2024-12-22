import SwiftUI

struct CardsView: View {

    @State var cardArr: [CreditCardModel] = [
        CreditCardModel(name: "Ziraat", number: "**** **** **** 4040", month_year: "09/32"),
        CreditCardModel(name: "Akbank", number: "**** **** **** 4041", month_year: "09/31"),
        CreditCardModel(name: "Yapı Kredi", number: "**** **** **** 4042", month_year: "09/30"),
        CreditCardModel(name: "İş Bankası", number: "**** **** **** 4043", month_year: "09/29"),
        CreditCardModel(name: "Garanti", number: "**** **** **** 4044", month_year: "09/28"),
    ]
    
    @State var subArr: [SubscriptionModel] = [
        SubscriptionModel(dict: [
            "id": 0,
            "name":"Spotify",
            "icon":"spotify_logo",
            "price":"9,99"
        ]),
        SubscriptionModel(dict: [
            "id": 1,
            "name":"HBO GO",
            "icon":"hbo_logo",
            "price":"14,99"
        ]),
        SubscriptionModel(dict: [
            "id": 2,
            "name":"Youtube Premium",
            "icon":"youtube_logo",
            "price":"19,99"
        ]),
        SubscriptionModel(dict: [
            "id": 3,
            "name":"OneDrive",
            "icon":"onedrive_logo",
            "price":"29,99"
        ]),
        SubscriptionModel(dict: [
            "id": 4,
            "name":"Netflix",
            "icon":"netflix_logo",
            "price":"39,99"
        ]),
    ]
    
    var body: some View {
        ScrollView {
            
            VStack {
                
                ZStack {
                    HStack {
                        Spacer()

                        Button {
                            
                        } label: {
                            Image("settings")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray30)
                        }
                        
                    }
                    
                    HStack {
                        Spacer()
                        
                        Text("Credit Cards")
                            .font(.customfont(.regular, fontSize: 16))
                        
                        Spacer()
                    }
                }
                .foregroundColor(.gray30)
                .padding(.horizontal, 20)
                
                
                CardStack(cardArr) { cObj in
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.gray70)
                            .frame(width: 232, height: 350)
                            .shadow(color: .black.opacity(0.2), radius: 4)
                        
                        Image("card_blank")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 232, height: 350)
                        
                        VStack(spacing: 8) {
                            Spacer()
                                .frame(height: 22)
                            
                            Image("mastercard_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)

                            Text("Virtual Card")
                                .font(.customfont(.semibold, fontSize: 16))
                            
                            Spacer()
                                .frame(height: 90)
                            
                            Text(cObj.name)
                                .font(.customfont(.semibold, fontSize: 12))
                                .foregroundColor(.gray20)
                                                        
                            Text(cObj.number)
                                .font(.customfont(.semibold, fontSize: 16))
                                                        
                            Text(cObj.month_year)
                                .font(.customfont(.semibold, fontSize: 14))
                            
                            Spacer()
                        }
                        .foregroundColor(.white)
                    
                    }

                }
                .padding(.vertical, 20)
                
                
                VStack {
                    Text("Subscriptions")
                        .font(.customfont(.semibold, fontSize: 16))
                    
                    HStack(spacing: 10) {
                        
                        Spacer()

                        ForEach(subArr) { sObj in
                            Image(sObj.icon)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        
                        Spacer()

                    }
                                        
                }
                .foregroundColor(.white)
                .padding(.top, 20)
                
                
                VStack {
                    Button {
                    } label: {
                        HStack {
                            Text("Add new card")
                                .font(.customfont(.semibold, fontSize: 14))
                            
                            Image("add")
                                .resizable()
                                .frame(width: 14, height: 14)
                        }
                    }
                    .foregroundColor(.gray30)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64, maxHeight: 64)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5,4]))
                            .foregroundColor(.gray30.opacity(0.5))
                    }
                    .cornerRadius(16)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    
                    Spacer()
                }
                .frame(width: .infinity, height: 300 )
                .background(Color.gray70)
                .cornerRadius(radius: 24, corners: [.topLeft, .topRight])
                .padding(.top, 40)
                
                
            }
            .padding(.top, .topInsets)
            
            
        }
        .background(Color.grayC)
        .ignoresSafeArea()
    }
    
}

#Preview {
    CardsView()
}
