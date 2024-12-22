import SwiftUI

struct AddSubscriptionView: View {

    var UIState: UIStateModel
    @State var txtDescription: String = ""
    @State var amountVal: Double = 0.0
    @State var isSubscription: Bool = true
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
        
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 80
        let cardHeight: CGFloat = 200
        
        ScrollView {
            
            ZStack(alignment: .center) {
                
                Rectangle()
                    .foregroundColor(.gray70.opacity(0.5))
                    .frame(width: .screenWidth)
                    .cornerRadius(25)
                
                VStack {
                    
                    ZStack {
                        HStack {
                            Button {
                                
                            } label: {
                                Image("back")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("New")
                                .font(.customfont(.regular, fontSize: 16))
                            
                            Spacer()
                        }
                    }
                    .foregroundColor(.gray30)
                    
                    Text("Add new\nsubscription")
                        .font(.customfont(.bold, fontSize: 40))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                    

                    Canvas
                    {
                        Carousel( numberOfItems: CGFloat( subArr.count ), spacing: spacing, widthOfHiddenCards: widthOfHiddenCards )
                        {
                            ForEach( subArr, id: \.self.id ) { item in
                                Item( _id:                  Int(item.itemId),
                                      spacing:              spacing,
                                      widthOfHiddenCards:   widthOfHiddenCards,
                                      cardHeight:           cardHeight )
                                {
                                    
                                    VStack{
                                        
                                        Image(item.icon)
                                            .resizable()
                                            .scaledToFit()
                                        
                                        Spacer()
                                            .frame(height: 20)
                                        Text("\(item.name)")
                                    }
                                    
                                    
                                }
                                .foregroundColor( .gray30 )
                                .cornerRadius( 8 )
                                .shadow(  radius: 4, x: 0, y: 4 )
                                .transition( AnyTransition.slide )
                                .animation( .spring() )
                            }
                        }
                        .environmentObject( self.UIState )
                    }
                    .padding(.vertical, 20)
                   
                    
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                
            }
            .frame(width: .screenWidth)
            
            RoundTextField(title: "Description", text: $txtDescription, textAlign: .center)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            HStack {
                
                Button {
                    amountVal -= 0.1
                    if(amountVal < 0) {
                        amountVal = 0.0
                    }
                } label: {
                    Image("minus")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(16)
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Monthly price")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.gray40)
                    
                    Spacer()
                        .frame(height: 4)

                    Text("$\( amountVal, specifier: "%.2f" )")
                        .font(.customfont(.bold, fontSize: 40))
                        .foregroundColor(.white)
                    
                    Spacer()
                        .frame(height: 8)
                    
                    Rectangle()
                        .fill(Color.gray70)
                        .frame(width: 150, height: 1)
                }
                
                Spacer()
                
                Button {
                    amountVal += 0.1
                } label: {
                    Image("plus")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(16)
                
            }
            .padding(40)
            
            PrimaryButton(title: "Add this platform") {
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
        }
        .background(Color.grayC)
        .ignoresSafeArea()
    }
    
}

#Preview {
    AddSubscriptionView(UIState: UIStateModel())
}
