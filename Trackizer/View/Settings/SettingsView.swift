import SwiftUI

struct SettingsView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ScrollView {
            
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
                        
                        Text("Settings")
                            .font(.customfont(.regular, fontSize: 16))
                        
                        Spacer()
                    }
                }
                .foregroundColor(.gray30)
            }
            .padding(.top, .topInsets)
            
            VStack {
                Image("u1")
                    .resizable()
                    .frame(width: 70, height: 70)
                
                Spacer()
                    .frame(height: 15)
                
                Text("Batuhan")
                    .font(.customfont(.bold, fontSize: 20))
                    .foregroundColor(.white)
                
                Spacer()
                    .frame(height: 15)
                
                Text("ariozbatuhan@gmail.com")
                    .font(.customfont(.bold, fontSize: 12))
                    .accentColor(.gray30)
                
                Spacer()
                    .frame(height: 15)
                
                Button {

                } label: {
                    Text("Edit Profile")
                        .font(.customfont(.semibold, fontSize: 12))
                }
                .foregroundColor(.white)
                .padding(8)
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(12)
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("General")
                    .font(.customfont(.semibold, fontSize: 12))
                    .padding(.top, 8)
                
                VStack {
                    
                    IconItemRow(icon: "face_id", title: "Security", value: "FaceID")
                    IconItemSwitchRow(icon: "icloud", title: "iCloud", value: $isActive)

                }
                .padding(.vertical, 10)
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(16)
                
                
                Text("My Subscriptions")
                    .font(.customfont(.semibold, fontSize: 12))
                    .padding(.top, 8)
                
                VStack {
                    
                    IconItemRow(icon: "sorting", title: "Sorting", value: "Date")
                    
                    IconItemRow(icon: "chart", title: "Summary", value: "Average")
                    
                    IconItemRow(icon: "money", title: "Default Currency", value: "USD ($)")

                }
                .padding(.vertical, 10)
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(16)
                
                
                Text("Appearance")
                    .font(.customfont(.semibold, fontSize: 12))
                    .padding(.top, 8)
                
                VStack {
                    
                    IconItemRow(icon: "app_icon", title: "App Icon", value: "Default")
                    
                    IconItemRow(icon: "light_theme", title: "Theme", value: "Dark")
                    
                    IconItemRow(icon: "font", title: "Font", value: "Inter")

                }
                .padding(.vertical, 10)
                .background(Color.gray60.opacity(0.2))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray70, lineWidth: 1)
                }
                .cornerRadius(16)
                
            }
            .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .background(Color.grayC)
        .ignoresSafeArea()
    }
}

#Preview {
    SettingsView()
}
