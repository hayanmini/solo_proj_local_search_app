# 📍 Flutter 지역 검색 및 리뷰 앱

Flutter로 제작한 지역 기반 검색 및 리뷰 작성 앱입니다.  
특정 장소를 검색하고, 해당 장소에 대한 리뷰를 작성하거나 조회할 수 있는 기능을 구현했습니다. 

---

## 🧩 주요 기능

| 기능 | 설명 |
|-----------|------|
| 🔍 **지역 검색** | Naver API를 통한 키워드 기반 지역(장소) 검색 기능 |
| 📍 **장소 리스트 출력** | 검색 결과에 해당하는 장소 목록 표시 |
| ✍️ **리뷰 작성** | 장소 리뷰 페이지에서 리뷰 입력 가능 |
| 💬 **리뷰 조회** | 장소별로 작성된 리뷰 목록 확인 |
| 🧭 **위치 기반 저장** | Firestore에 `mapX`, `mapY` 좌표 기준으로 리뷰 저장 |
| 🌐 **Firebase 연동** | Firestore를 통한 데이터 관리 |

---

## 🛠 사용 기술

| 카테고리 | 내용 |
|----------|------|
| **Framework** | Flutter (3.x) |
| **State Management** | Riverpod (async + family 활용) |
| **Backend** | Firebase Firestore |
| **Language** | Dart |
| **기타** | Naver API (장소 검색), TextField 커스텀 등 |

---

## 📁 프로젝트 구조

```dart
📁 lib/
├── 📑 main.dart
├── 📁 data/
│   ├── 📁 model/         // 데이터 모델 (Location, Review 등)
│   ├── 📁 repository/    // Firebase와 Naver API 통신
├── 📁 presentation/
│   ├── 📁 home/          // 홈 및 검색 UI (장소 리스트 및 상세)
│   ├── 📁 review/        // 리뷰 목록 및 작성 UI
│   │   ├── viewmodel/    // Riverpod ViewModel (Home, Review 각 하위에)
```

---

## ⚙️ 실행 방법

```dart
flutter pub get
```

---

## 💫 앱 사용 흐름

### ✅ 홈 화면 (HomePage)

✔️ 찾고 싶은 장소를 검색, 입력 시 즉시 반영하여 리스트 출력
<br>
✔️ 원하는 장소 선택 시 리뷰 페이지 이동

### ✅ 리뷰 화면 (ReviewPage)

✔️ 해당 장소의 리뷰 리스트를 데이터 받아서 출력
<br>
✔️ 리뷰 입력 시 즉시 UI 반영 및 데이터 전달

---

## 🔮 앞으로 추가하면 좋은 기능

| 기능              | 설명                                                   |
| ----------------- | ------------------------------------------------------ |
| 🔍 검색 버튼 기능 | 키보드의 done 외에 눈에 보이는 검색 버튼 기능              |
| 🌎 내 위치 기반   | 내 위치 GPS 기반 지역 검색 기능                           |
| 🧾 리뷰 내역 저장 | 내 작성 리뷰 내역들을 모아 리스트로 확인 가능한 기능        |
| 🧑 사용자 로그인  | 리뷰 기록을 사용자 단위로 관리, 리뷰 수정 및 삭제 기능      |

---

### ✨ 프로젝트 목적

✔️ Flutter의 **RiverPod**, **Firebase**, **API** 에 대한 이해
<br>
✔️ 사용자 중심의 UI/UX 설계 연습 (검색 시 입력 텍스트 즉시 반영하여 리스트 출력, 리뷰 등록 시 즉시 표출 등)
<br>
✔️ MVVM을 사용하여 Model, View, ViewModer 분리로 프로젝트 관리 능력 향상

---

### 📝 회고

✔️ RiverPod, Firebase, API를 사용한 작업이 처음으로 좀 오래 걸리고 어려웠으나 편리했음.
<br>
✔️ 다음 작업에서도 사용할 수 있을 것 같음.
<br>

---

🌸 Velog : [@dudals9696](https://velog.io/@dudals9696/posts) <br>
👩‍💻 GitHub : hayanmini(hayancode)
