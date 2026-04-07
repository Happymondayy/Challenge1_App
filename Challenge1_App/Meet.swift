//
//  Meet.swift
//  Challenge1_App
//
//  Created by yunseo on 3/31/26.
//

import SwiftUI

struct Meet: View {
    @State private var showAlert = false
    @Environment(\.dismiss) private var dismiss
    
    let friend: Friend
    let myNickname: String
    let myInitial: String
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing:25){
            Text("Meet")
                .font(.title2)
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .foregroundStyle(Color.green)
                //.padding(.top, 10)
            VStack{
                HStack{
                    VStack{
                        Circle()
                            .fill(Color("Green_2"))
                            .frame(width: 80, height: 80)
                            .overlay(
                                Text(myInitial)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        Text(myNickname)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .fontDesign(.monospaced)
                            .foregroundStyle(Color.gray.opacity(0.8))
                    }
                    VStack{
                        Circle()
                            .fill(Color("Green_2"))
                            .frame(width: 80, height: 80)
                            .overlay(
                                Text(friend.initial)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        Text(friend.nickname)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .fontDesign(.monospaced)
                            .foregroundStyle(Color.gray.opacity(0.8))
                    }
                }
                .padding()
                VStack{
                    Text("공통 관심사는 \(friend.interest)입니다!")
                        .foregroundStyle(Color.white)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(Color.green.opacity(0.8))
                .cornerRadius(15)
                .padding(.horizontal)
                VStack{
                    Text("\(friend.nickname)의 위치는 \(friend.location)입니다!")
                        .foregroundStyle(Color.white)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .fontDesign(.monospaced)
                        .foregroundStyle(Color.black)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(Color.green.opacity(0.8))
                .cornerRadius(15)
                .padding(.horizontal)
                
            }
            .padding(20)
            .background(Color(.systemGray6))
            .cornerRadius(25)
            .padding(.horizontal,30)
            .padding(.top, 10)
            
            //Spacer()
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 10){
                    //.flexible()은 LazyVGrid에서 GridItem의 크기를 유연하게 한다.
                    ForEach(["IMG_1000","IMG_1001","IMG_1399","IMG_1387"], id: \.self){ imageName in
                        Image(imageName)
                            //이미지 크기 조절
                            .resizable()
                            //이미지가 박스를 꽉 채우게 해줌, 비율 유지
                            .scaledToFill()
                            //높이 135 고정
                            .frame(height: 135)
                            //모서리 둥글게 만듬
                            .cornerRadius(16)
                            //박스 밖으로 나가는 이미지를 잘라준다.
                            .clipped()
                    }
                }
            }
            .padding(.horizontal,30)
            //Spacer()
            
            HStack(spacing:10){
                Button(action: {showAlert = true}){
                    Text("만나기")
                        .font(.title3)
                        .fontDesign(.monospaced)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                }
                .frame(width: 140)
                .padding(15)
                .background(Color.green)
                .cornerRadius(25)
                .alert("냐냐냥 완료!", isPresented: $showAlert) {
                    Button("OK"){
                        dismiss()
                    }
                } message: {
                    Text("\(friend.nickname)님과 연결됐어요!")
                }
                
                Button(action: {
                    dismiss()
                }){
                    Text("나중에")
                        .font(.title3)
                        .fontDesign(.monospaced)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                }
                .frame(width: 140)
                .padding(15)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(25)
        
            }
        }
        
    }//마지막
}

#Preview {
    Meet(friend: Friend(initial: "K", nickname: "Kou", interest: "음악", location: "카페", bio: "안녕하세요!"), myNickname: "Kou", myInitial: "K")
}
