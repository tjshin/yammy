# 프로야구 로컬 팬덤 커뮤니티

---

## 팀명 & 프로젝트명

***야미 YAMMY (야구 yagu + yummy)***

- '야구에 미치다' - 야구 관련 커뮤니티
- '야구장 주변 지역 맛있는(yummy) 맛집 리뷰'

![](README.assets/index.png)

---

## 목표

- 프로야구 구장 방문 시 선수들과 팬들이 자주 찾는 경기장 주변 맛집 정보 공유
- 방문 후기 및 경기 관련 정보 공유, 티켓 양도 등을 할 수 있는 '로컬 팬덤 '커뮤니티 제작



---

### 주요기능

1. 로그인, 로그아웃 (카카오 연동, 구글 연동)
2. 회원가입 (회원등급)
3. 관리자 페이지(회원 관리), 마이 페이지(일반 유저)
   - 저장한 글(북마크, 스크랩) 조회, 내가 쓴 글 조회
   - 쪽지 보내기 기능, 주고 받은 쪽지 내역
4. 공지사항
5. 챗봇(Q&A)
6. 티켓 양도
7. 카카오 지도 API 활용, 맛집 장소 마킹: 선수들과 팬들이 추천한 장소 마킹
   - 경기장 주변 맛집 (선수+팬들이 선호) 정보
8. 게시판 CRUD, 답변, 댓글 등: 각 구장(지역이자 팀) 별로
   - 머릿글 기능(경기장 관련 정보, 원정 응원 후기, 굿즈 정보 등)
   - 게시글 정렬 기능



#### 추가 기능 (주요기능 구현 목표 달성 시)

- 커뮤니티 활동 마일리지, 포인트
- 티켓 양도 기능에 메신저 추가(구매자:판매자)
- 게시글 추천 기능: 추천 수 많은 게시글을 홈페이지 전면 혹은 상단 노출 
- 유저 신고 기능(악성 댓글, 광고성 게시글): 관리자 페이지

---

### 사용환경

- Java
- Spring boot
- Oracle DB
- css, html, js

---

### 역할 분담

- 김주영: 주요기능 1번~5번
  회원 관리 및 공지사항, Q&A
- 오종빈: 주요기능 6번
  티켓 양도 페이지 구현
- 신태진: 주요기능 7번
  지도 API 분석 및 적용 구현
- 박창석: 주요기능 8번
  구장별 게시판 구현

