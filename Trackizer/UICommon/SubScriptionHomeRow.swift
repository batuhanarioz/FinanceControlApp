import SwiftUI

struct SubScriptionHomeRow: View {
    
    @State var sObj: SubscriptionModel =
        SubscriptionModel(dict: [
            "name":"Spotify",
            "icon":"spotify_logo",
            "price":"9,99"
        ])
    
    var body: some View {
        HStack {
            
            Image(sObj.icon)
                .resizable()
                .frame(width: 40, height: 40)
            Text(sObj.name)
                .font(.customfont(.semibold, fontSize: 14))
                .foregroundColor(.white)
            Spacer()
            Text("$\(sObj.price)")
                .font(.customfont(.semibold, fontSize: 14))
                .foregroundColor(.white)
            
        }
        .padding(15)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 42, maxHeight: 42)
        .padding(8)
        .background(Color.gray60.opacity(0.2))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray70, lineWidth: 1)
        }
        .cornerRadius(12)
    }
}

#Preview {
    SubScriptionHomeRow()
}
