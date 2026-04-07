//
//  ContentView.swift
//  Challenge1_App
//
//  Created by yunseo on 3/31/26.
//

import SwiftUI

struct ContentView: View {
    @State var nickname: String = ""
    @State var bio: String = ""
    @State var selectedFriend: Friend? = nil //화면 전환 했을 때 친구들 정보 기억해야 함 . 그래서 상태 변수 필요, Friend? = nil은 처음에 아무 친구도 안눌렀으니까 nil로 시작해야 한다.
    @State var selectedInterest: String? = nil
    @State var selectedLoaction: String? = nil
    @State private var buttonColor = (Color.green.opacity(0.8))

    
    let interests: [String] = ["게임", "영화", "독서", "여행", "운동", "음악"]
    let locations: [String] = ["기숙사","C5아카데미","도서관","카페","편의점","영화관"]
    //let locations : [String] = ["기숙사","C5아카데미","도서관","카페","편의점","영화관"]
    
    @State var friends: [Friend] = [
        Friend(initial: "K", nickname: "Kou", interest: "영화", location: "카페", bio: "영화보는거랑 노래 듣는 것을 좋아해요!! 같이 즐겨요!!"),
        Friend(initial: "A", nickname: "Alex", interest: "음악", location: "카페", bio: "Let's GOOO"),
        Friend(initial: "J", nickname: "Jane", interest: "독서", location: "도서관", bio: "책을 좋아합니다."),
        Friend(initial: "B", nickname: "Boo", interest: "운동", location: "C5아카데미", bio: "냐냐냥"),
        Friend(initial: "C", nickname: "Caesar", interest: "게임", location: "기숙사", bio: "Studyyyy"),
        Friend(initial: "S", nickname: "Sara", interest: "영화", location: "영화관", bio: "영화 매일 봐요!"),
        Friend(initial: "M", nickname: "Mike", interest: "게임", location: "기숙사", bio: "게임 같이 해요!"),
        Friend(initial: "L", nickname: "Lisa", interest: "여행", location: "카페", bio: "여행 얘기 좋아해요!"),
        Friend(initial: "P", nickname: "Paul", interest: "운동", location: "C5아카데미", bio: "같이 운동해요!"),
        Friend(initial: "H", nickname: "Hana", interest: "독서", location: "도서관", bio: "조용히 책 읽어요."),
        Friend(initial: "T", nickname: "Tom", interest: "음악", location: "영화관", bio: "음악 추천 환영!"),
        Friend(initial: "E", nickname: "Ella", interest: "여행", location: "기숙사", bio: "다음 여행 계획 중!"),
        Friend(initial: "R", nickname: "Ryan", interest: "게임", location: "C5아카데미", bio: "FPS 좋아해요."),
        Friend(initial: "N", nickname: "Nara", interest: "영화", location: "도서관", bio: "영화 리뷰 써요."),
        Friend(initial: "W", nickname: "Woo", interest: "운동", location: "기숙사", bio: "매일 아침 운동!"),
        Friend(initial: "Y", nickname: "Yuna", interest: "음악", location: "카페", bio: "카페에서 음악 들어요."),
        Friend(initial: "D", nickname: "Dan", interest: "독서", location: "편의점", bio: "편의점 책 다 읽었어요."),
        Friend(initial: "I", nickname: "Iris", interest: "여행", location: "영화관", bio: "세계 여행이 꿈!"),
        Friend(initial: "O", nickname: "Owen", interest: "게임", location: "도서관", bio: "조용히 게임해요."),
        Friend(initial: "F", nickname: "Faye", interest: "영화", location: "기숙사", bio: "넷플릭스 고수!"),
        Friend(initial: "G", nickname: "Gray", interest: "운동", location: "카페", bio: "운동 후 카페!"),
        Friend(initial: "Q", nickname: "Quinn", interest: "음악", location: "C5아카데미", bio: "밴드 하고 싶어요."),
        Friend(initial: "V", nickname: "Vera", interest: "독서", location: "편의점", bio: "만화책 좋아해요."),
        Friend(initial: "U", nickname: "Uma", interest: "여행", location: "C5아카데미", bio: "배낭여행 다녀왔어요!"),
        Friend(initial: "X", nickname: "Xena", interest: "게임", location: "카페", bio: "보드게임 좋아요!"),
        Friend(initial: "Z", nickname: "Zack", interest: "영화", location: "편의점", bio: "공포영화 전문!"),
        Friend(initial: "수", nickname: "수지", interest: "운동", location: "도서관", bio: "요가 배우는 중!"),
        Friend(initial: "민", nickname: "민지", interest: "음악", location: "기숙사", bio: "기타 독학 중이에요."),
        Friend(initial: "준", nickname: "준호", interest: "독서", location: "영화관", bio: "영화 원작 소설 읽어요."),
        Friend(initial: "하", nickname: "하은", interest: "여행", location: "편의점", bio: "여행 간식 연구 중!")
    ].shuffled()
    
    var filteredFriends: [Friend] {
        friends.filter { friend in
            (selectedInterest == nil || friend.interest == selectedInterest) &&
            (selectedLoaction == nil || friend.location == selectedLoaction)
        }
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 20){
            //Profil 섹션
            /*
             VStack(alignment: .leading,spacing: 10){
             Text("Profile")
             .font(.title3)
             .foregroundStyle(Color.green)
             .fontDesign(.monospaced)
             .fontWeight(.bold)
             .padding()
             
             TextField("닉네임을 입력해주세요!",text: $nickname)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             
             TextField("소개글을 입력해주세요!",text: $bio)
             .textFieldStyle(RoundedBorderTextFieldStyle())
             */
            //닉네임 보여지는 섹션
            Text("Hello,Kou")
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .foregroundStyle(Color("Blue_1"))
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                
            VStack(alignment: .leading,spacing: 10){
                //관심사 섹션
                Text("관심사")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .fontDesign(.monospaced)
                    .foregroundStyle(Color(.gray))
                //태그 라벨 관심사
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:10){
                            ForEach (interests,id:\.self){interest in
                                Button(action: {
                                    selectedInterest = (selectedInterest == interest) ? nil : interest
                                })
                                // 삼항 연산자를 if문으로 바꾸면
                                /*
                                if selectedInterest == interest {
                                    selectedInterest = nil
                                } else {
                                    selectedInterest = interest
                                }*/
                                {
                                    Text(interest)
                                        .fixedSize()
                                        .foregroundStyle(selectedInterest == interest ? .white : .white)
                                        .padding(.horizontal,25)
                                        .padding(.vertical,4)
                                        .background(selectedInterest == interest ? Color.green.opacity(0.8) : Color.gray.opacity(0.2))
                                        .cornerRadius(14)
                                }
                            }
                    }
                    .padding(.horizontal,10)
                }
                //위치 섹션
                Text("위치")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .fontDesign(.monospaced)
                    .foregroundStyle(Color(.gray))
                //위치 태그 라벨 섹션
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:10){
                        ForEach (locations,id:\.self){location in
                            Button(action:{
                                selectedLoaction = (selectedLoaction == location) ? nil : location
                            }){
                                Text(location)
                                    .fixedSize()
                                    .foregroundStyle(selectedLoaction == location ? .white : .white)
                                    .padding(.horizontal,25)
                                    .padding(.vertical,4)
                                    .background(selectedLoaction == location ? Color.green.opacity(0.8) : Color.gray.opacity(0.2))
                                    .cornerRadius(14)
                            }
                        }
                    }
                    .padding(.horizontal,10)
                }
            }
            .padding(18)
            .background(Color.gray.opacity(0.08))
            .cornerRadius(25)
            
            
            
            Text("Today's Friends")
                .font(.title3)
                .fontDesign(.monospaced)
                .foregroundStyle(Color("Blue_1"))
                .fontWeight(.bold)
                .padding(.vertical,5)
            ScrollView(.horizontal, showsIndicators: false) {//showsIndicators: false는 밑에 스크롤 안보이게 하는 것 -> true누르면 다시 보임
                HStack(spacing: 15) {
                    ForEach(filteredFriends) { friend in
                        VStack(spacing: 15) {
                            //닉네임 글자 보여지는 원
                            Circle()
                                .fill(Color("Green_2"))
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Text(friend.initial)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                )
                            //관심사 * 위치 보여지는 상자
                            VStack(spacing: 4) {
                                Text(friend.nickname)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                Text("\(friend.interest) • \(friend.location)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .cornerRadius(12)
                            
                            //소개글 보여지는 상자
                            Text(friend.bio)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            //네모 박스 프레임 조절하는 값
                            //.frame(width: UIScreen.main.bounds.width * 0.7, height: 150)
                                .frame(width: 300, height: 150)
                                .background(Color(.systemGray5))
                                .cornerRadius(12)
                            
                            //만나기 버튼
                            Button(action: {
                                selectedFriend = friend
                            }) {
                                Text("만나기")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 150)
                                    .padding(.vertical, 10)
                                    .background(Color.green)
                                    .cornerRadius(20)
                            }
                        }
                        //오늘의 친구 바깥 상자 - 회색
                        .padding(18)
                        .background(Color(.systemGray6))
                        .cornerRadius(25)
                    }
                }
            }
        }
        .padding(.horizontal,20)//전체적인 여백
        .padding(.top,40)//맨 위에 여백
        .sheet(item: $selectedFriend) { friend in
            Meet(friend: friend, myNickname: "Kou", myInitial: "K")
        }
        Spacer()
        
    }
}

#Preview {
    ContentView()
}
