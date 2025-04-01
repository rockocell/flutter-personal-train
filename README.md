# 개인과제 - 기차 예매 앱
Flutter 앱개발반에서 진행한 세 번째 개인과제 프로젝트입니다. Flutter application으로 간단한 기차 예매 앱을 구현했습니다.

**Tech used:** dart

## Pages

<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcdwgN5%2FbtsM4KJcahF%2FskrIUdD1KdEYx8hGmIGCtK%2Fimg.png" width=220>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FeVs2au%2FbtsM5Rm1Fz0%2FQnWkoggUjAQzDghOBCssO0%2Fimg.png" width=220>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FAeYw7%2FbtsM5CKngrL%2FiyT3dO5ZPchtIjPPKsxws1%2Fimg.png" width=220>
<br/>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcj3aSy%2FbtsM2Hz5zm8%2F5kWkcigD9G5z7c1yogIk2k%2Fimg.png" width=220>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FLXZth%2FbtsM40E10fn%2FVLyWiXuQZUv3nmvLBQBRrk%2Fimg.png" width=220>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcTytkv%2FbtsM4shoV59%2FbPB4fviadkaX4eITfknK5K%2Fimg.png" width=220>
<br/>
<br/>
총 5개의 페이지로 구성되어 있으며, 다크 테마를 지원합니다.

## 구현 범위:

### 필수기능 1~3
- [X] HomePage 구현
- [X] StationListPage 구현
- [X] SeatPage 구현

### 도전기능 1~2
- [X] UX를 고려한 기능 - 사용자가 이미 고른 역 반대편 역에서 제외
- [X] 다크 테마 적용

### 추가기능 3가지
- [X] UX를 고려한 기능 2 - SnackBar로 사용자 안내 문구 출력
- [X] MyTicket 구현
- [X] MySeat 구현

## 추가기능:

### 1. SnackBar로 사용자 안내 문구 출력
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbix58S%2FbtsM44tSqVw%2FIlVhfs1FkLl8hqqgf1Tr20%2Fimg.png" width=220>
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbQh45d%2FbtsM3DRDXUr%2Fbnusdae6eioPHBQ3MXIgf1%2Fimg.png" width=220>
<br/>
<br/>

**[ 설명 ]**
 - ElevatedButton 입력이 있지만 다음 페이지로 이동할 조건을 갖추지 못한 경우 사용자에게 안내 문구를 출력한다.
 - displaySnackBar 위젯을 사용하고, 해당 위젯 스타일을 외부 메서드화하여 재사용을 용이하게 한다.

### 2. MyTicket 구현
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FyjQoZ%2FbtsM4ZF9Dcy%2FQ9KXQAcAzOUKGBhVLqmOw0%2Fimg.jpg" width=220>
<br/>

**[ 설명 ]**
티켓 정보를 보여주는 페이지
1. **뒤로가기 버튼**
   - 뒤로가기
2. **앱바 타이틀**
3. **홈 버튼**
   - `HomePage`로 이동
4. **출발역, 도착역 표시 영역**
   - `HomePage`에서 사용한 레이아웃과 동일하게 표시
5. **좌석위치 표시 영역**
   - '좌석위치 `row` - `col`' 형식으로 표시
6. **좌석위치 확인 버튼**
   - `MySeat`으로 이동
  
### 3. MySeat 구현
<img src = "https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcxj5gB%2FbtsM40yjaAB%2FYYmkXW0qJ4DUhGVUKi5I20%2Fimg.jpg" width=220>
<br/>

**[ 설명 ]**
좌석 위치를 보여주는 페이지
1. **뒤로가기 버튼**
   - 뒤로가기
2. **앱바 타이틀**
3. **리스트뷰 영역**
   - `SeatPage`와 동일한 레이아웃으로 좌석 위젯들을 배치하고 선택한 좌석의 위치를 표시


## 트러블슈팅:
#### SeatPage, MySeat 중복 코드 위젯화
 - 문제점: SeatPage 내의 레이아웃 구현 코드 위젯화가 어려워 비슷한 레이아웃을 가지는 MySeat에서 유사한 코드를 재작성함
 - 해결책: SeatPage 에서 사용하는 지역 변수 대신 전역 변수를 사용하여 내부 코드 위젯화 및 파일 분리의 편의성 높임
 - 개선점: 코드의 재사용성 높임

#### 페이지 간 변수 전달 대신 전역변수 사용
 - 문제점: 페이지 간 이동마다 지역변수를 전달해 코드가 복잡해짐
 - 해결책: 여러 페이지가 함꼐 사용하는 변수를 전역변수로 선언
 - 개선점: 코드 복잡도를 낮추고 변수 관리가 쉬워짐

#### 예외 처리로 ?String 타입 변수 Text위젯에 사용
 - 문제점: 지역변수 대신 null값을 가질 수 있는 전역변수를 사용하면서 기존 코드 오류 발생
 - 해결책: 조건문 추가 대신 지연 - 예외 처리 방식 사용
 - 개선점: 기존 코드를 거의 유지하며 전역변수로 코드 개선

## 구현하며 배운 것
 - Flutter 레이아웃을 그리고 GestureDetector로 입력 처리하기
 - 페이지 간 이동 구현하기
 - 지역변수, 전역변수의 차이를 이해하고 상황에 맞게 사용하기
 - 파일 역할에 따라 경로를 정리하고 적절히 임포트해 사용하기
 - 함수를 사용하여 반복되는 레이아웃 구현하기
 - 코드를 메서드화하여 반복 사용하기
 - 사용자 입력으로 변한 상태를 화면에 적용하기