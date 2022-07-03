# ✍️ 일기장 프로젝트 저장소 
 
> 프로젝트 기간 2022.06.13 ~ 2022.07.01 </br> 
팀원: Quokkaaa (https://github.com/Quokkaaa), Taeangel (https://github.com/Taeangel)
리뷰어: 라자냐 (https://github.com/wonhee009)
 
## 🛠 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]() [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]() [![iOS](https://img.shields.io/badge/iOS-14.0-red)]()
 
## 목차
 
- [프로젝트 소개](#프로젝트-소개) 
 
- [STEP1](#STEP1)
    + [타임라인](#🗓타임라인) 
    + [고민한점](#🤔고민한점) 
    + [트러블슈팅](#🔥TroubleShooting) 
- [STEP2](#STEP2)
    + [타임라인](#📅타임라인) 
    + [고민한점](#🤨고민한점) 
    + [트러블슈팅](#🧨TroubleShooting) 
- [STEP3](#STEP3)
    + [타임라인](#📆타임라인) 
    + [고민한점](#🧐고민한점) 
    + [트러블슈팅](#📛TroubleShooting) 

- [그라운드 룰](#그라운드-룰)
    + [활동 시간](#활동-시간)
    + [코딩 컨벤션](#코딩-컨벤션)

---

|Write|Update|DeleteDetail|
|:---:|:---:|:---:|
|<img src="https://i.imgur.com/tghKhmp.gif" width="250" height="450"/>|<img src="https://i.imgur.com/7CnX9yh.gif" width="250" height="450"/>|<img src="https://i.imgur.com/O1iW7tO.gif" width="250" height="450"/>|

|DeleteMain|ActivityDetail|ActivityMain|
|:---:|:---:|:---:|
|<img src="https://i.imgur.com/GeTqfbT.gif" width="250" height="450"/>|<img src="https://i.imgur.com/k2J1Bmh.gif" width="250" height="450"/>|<img src="https://i.imgur.com/85Mfiig.gif" width="250" height="450"/>
|

|가로화면|
|:---:|
|![](https://user-images.githubusercontent.com/91132536/174265724-877d64e6-3b6e-4172-b7ff-e5c6ed28f5a1.gif)|


## [STEP 1]

# 🗓타임라인
- 월 - 그라운드룰 정하기 및 issue 설정 / swift lint 적용해보기(optional)
- 화 - UIKit: Apps for Every Size and Shape 시청
- 수 - Making Apps Adaptive, Part 1 / Script, Making Apps Adaptive, Part 2 / Script / 학습활동예습(Core Graphics)
- 목 - 오전 학습 활동 예습 / 학습활동 정리 및 프로젝트 PR보내기
- 금 - README작성 및 리펙토링

# 🤔고민한점
**가로 길이가 모호하다는 말**

> 가로 길이가 모호하다는 에러에 대해서 공식문서를 확인해보니 뷰의 위치와 크기를 정해주지않았을때, 동일한 우선순위를 가진 뷰가 존재할때 발생하는것으로 확인하였습니다. 저의 에러같은경우 후자 문제였고 horizontal stackView내에 두개의 UILabel이 존재하는데 이 두 레이블의 길이의 우선도를 정해줌으로써 해결할 수 있었습니다.
`label.setContentCompressionResistancePriority(.required, for: .horizontal)`

**키보드의 동적인 스크롤 설정**

> 키보드의 높이만큼 contentInset을 올려주도록 설정하는 방식으로 구현이되는데 이에 필요한 contentInset과 contentOffset의 차이점에대해서 간단하게 알아보았습니다.

**tableView를 구현하는 방법에대해서**

> UITableViewController를 상속받아서 구현하는 방법 vs UIViewController를 상속받아서 tableView프로퍼티를 만들어 구현하는 방법이 있었습니다.
STEP1 내용으로만 보면 UITableViewController을 상속받아서 구현해도 전혀 무리가 없어보였습니다. 그런데 다음 STEP과 다른 기능들을 추가하는 확장성을 고려해보니 tableView 프로퍼티를 따로 만들어서 사용하는게 유연할것같아 후자로 구현하였습니다

**JsonSingleton**

>만약 제이슨Deoder을 사용할 경우 아래와 같이 사용하게 되는데 
`let diaryData = try? JSONDecoder().decode([Diary].self, from: jsonData)`
이와 같이 사용하게 되면 decode할 때마다 JSONDecoder()계속 생성을 하기 때문에 singleton을 사용하였는데 어떤 방향이 더 효율적인지 고민하였습니다.

**파일분리**

> 기존에 MVC패턴으로 view와 controller와 model폴더를 각각 만들어서 파일을 관리했었습니다. 그런데 코드를 수정하게될때 특정 화면을 찾아가서 수정하기에는 번거로움이있었습니다. 그래서 Scene별로 폴더를 구분하여 관리를 해주었습니다.

> Utils라는 폴더로 extension, sington, protocol, 등을 관리하고있다. 이는 유용한 편리한이라는 뜻을 가지고 있으며 기본적으로 Model에서 사용한 구조에서 더 편리하게 개조를 하거나 데이터를 가져와줄 수 있는 부가적인 구조를 넣어주는것으로 이해하였다.

**폴더네이밍에 대해서**

> 보편적으로 Extension폴더내에 Extension파일을 생성할때 타입+extension이라는 네이밍을 자주써주는데 Extension폴더내에 있는 파일인데 +extension이라는 네이밍을 붙여줄필요가 있을까?
type.method() 이런식으로 접근하듯 같은 맥락이라고 생각하면 없애도 무방할것같아 지워주는 방향으로 네이밍을 작성하였다. 같은 맥락으로 프로젝트 이름이 Diary인데 내부파일 이름에 Diary를 붙여주는 것도 더 햇갈릴 수 있을것 같아 최대한 중복되는 네이밍은 생략하려고 했습니다.


# 🔥TroubleShooting
<img width="400px" src="https://i.imgur.com/JQ8LhpV.png"/>

> 위 사진과 같이 cell이 계단형식으로 나오는 문제가 발생하여 계속 찾아보았는데요 문제가 cell이 겹치는 것이 문제라 생각했습니다 그래서 문제를 해결 하려고 cell안에 폰트를 변경하여 cell이 겹치지 않도록 해결하였습니다.

## swiftlint를 적용후 gitignore에 추가하지 않고 commit
>gitignore swiftlint 적용방법
```
# swiftlint
/Pods    //폴더라 /붙여줌
Podfile.lock
Podfile
```
>를 gitignore에 넣어주면 된다 
이미 gitignore에 올라간 파일을 지우기위해서는 
gitignore에 무시할 파일을 넣어준다음에 

```
git rm -r --cached .
git add. 
git commit -m "커밋메세지"
git push origin {브랜치명}
```
> 위순으로 입력해주면된다.

## [STEP2]

# 📅타임라인
- 월 - STEP2 리펙토링
- 화 - CoreData CRUD 구현 및 ActivityView 학습
- 수 - STEP2 CRUD 구현
- 목 - 학습활동 예습 및 STEP2 ActivityView, Alert 구현 후 PR
- 금 - STEP2 리펙토링 및 README 작성

# 🤨고민한점
**NotificationCenter를 활용한 백그라운드 기능설정**
> background에서 데이터저장 기능을 수행할 수 있는 방법을 고민
```swift
NotificationCenter.default.addObserver(
      self,
      selector: action,
      name: UIApplication.didEnterBackgroundNotification,
      object: nil)
```
> 으로 노티피케이션을 등록을 해준다음 

```swift
func sceneDidEnterBackground(_ scene: UIScene) {
    NotificationCenter.default.post(name: UIApplication.didEnterBackgroundNotification, object: nil)
  }
```
> sceneDelegate에서 sceneDidEnterBackground 메서드를 활용하여 백그라운드 진입시 사용할 메서드를 선언해주고 
```swift
NotificationCenter.default.removeObserver(self)
```
> 를 활용하여 노티피케이션 센터를 해제해주면 된다

**Background로 진입했을때의 @objc 메서드 네이밍에 설정에 관하여**
> action 메서드 네이밍을 주로 주체+액션 형식으로 많이 사용된다. 그러다보니 형식을 맞춰주는게 좋지않을까?
생각을 했다. observer를 등록하는 네이밍을 처음에 saveDiaryData String으로 지정을 해주었었지만
UIApplication.didEnterBackgroundNotification으로 대체가 가능했다. 
리뷰어와 얘기를 나누어본결과 충분히 의미전달만된다면 생략해도 무방하다는 말씀을해주셔서 
주체+액션 -> 주체로 네이밍으로 사용했다.

**writeScene과 DetaileScene이 중복되는 부분**
> writeScene과 DetaileScene이 겹치는 부분이 상당히 많았다. 겹치는 부분을 해결하기 위해서는 프로토콜을 사용하는 방법과 상속을 활용하는 2가지 방법이 있었다. 하지만 이번 프로잭트에서는 겹치는 부분이 상당히 많아서 상속을 활용하여 중복되는 부분을 처리하였다.

# 🧨TroubleShooting

1. 에러에 DiaryModel의 description이 키-밸류 타입이 아니어서 발생한 오류

### [Error]
![](https://i.imgur.com/8V4yaRO.png)

### [Before]
![](https://i.imgur.com/inHPQAn.png)

### [After]
![](https://i.imgur.com/8oNM1AI.png)


2. 일의 순서를 대충 정했을때 발생한 오류
> textView의 title과 content를 구분하는 작업부터 했어야 했는데 일단 넘어가자~ 라는 안일함으로 삽질을 시작했다.

핵심은 데이터 저장 및 업데이트 시 title과 content 모두 textView.text에 들어가있었다.프로잭트 마지막에 title과 content를 분리하는 기능을 구현하는 순으로 계획을 했었는데 textView.text에서 title과 content를 처음부터 분리하여 넣었으면 이처럼 고생하지 않았을 텐데 일의 순서를 차례대로 정했어야 했는데 처음에 순서를 정할때 좀더 공들여 순서를 정해야 겠다. 그래야 나중에 삽질을 하지 않을 확률이 올라갈 것 같다.

- title과 content를 분리하고 다시 textView에 합치는 구조이다. 그런데 여기서 분리하고 합친후 특정 cell을 클릭하고 나갔다가를 계속반복(업데이트를 반복)했을때 textView의 text가 배로 늘어나거나 content가 cell에 업데이트가 안되던가 하는 문제가 발생했다.

[문제 발생의 원인]
title과 content를 분리할때 첫문단을 title로 꺼내와서 저장을하는데 전에 데이터를 업데이트하면서 title 과 content가 붙어서 첫문단에 기록이 되는 현상이 발생했다.

[해결방법]
title과 content 사이에 `\n`을 넣어줌으로써 첫문단을 content를 구분해주었다.

3. 더보기에서 글 삭제 후 MainVC의 TableViewCell 뒤섞임 오류 해결

> 이전에는 deleteContext메서드에서 viewContext.save를 해주지않았었지만 아래와 같이 저장 코드 추가하여 해결했다.

```swift
    guard viewContext.hasChanges else {
    return []
    }

    try viewContext.save()
```
save()를 통해 변경 사항을 저장한다고 하는데 save 해주지 않으면 context를 일정하게 유지할 수 없어서 TableViewCell 뒤섞였던 것이였다.

4. data가 업데이트를 전체를 viewWillAppear에서 업로드 하는 부분은 낭비라는 고민 

> 기존에는 viewWillAppear에서 CoreData의 값을 read해오는 방식이었다. 이 방식은
모든 값을 다시 read해오기때문에 비효율적이기때문에 아래와같이 delegate형식으로 특정값만 update해주는 방식으로 변경했다.

[Before]
```swift
final class MainViewController: UIViewController {
  private lazy var baseView = ListView(frame: view.bounds)
  private var diarys: [Diary]? {
    didSet {
      DispatchQueue.main.async {
        self.baseView.tableView.reloadData()
      }
    }
  }
	
extension MainViewController: Diaryable {
  func updateDiary(from diary: Diary) {
    self.diarys?.forEach ({
      if $0.identifier == diary.identifier {
        $0.title = diary.title
        $0.content = diary.content
      }
    })
  }
```

[After]

```swift
extension MainViewController: Diaryable {
  func updateDiary(from diary: Diary) {
    self.diarys?.forEach ({
      if $0.identifier == diary.identifier {
        $0.title = diary.title
        $0.content = diary.content
      }
    })
    DispatchQueue.main.async {
      self.baseView.tableView.reloadData()
    }
  }
```

[After]

```swift
extension MainViewController: Diaryable {
  func updateDiary(from diary: Diary) {
    DispatchQueue.main.async {
      self.baseView.tableView.reloadData()
    }
  }
```

> 기존에 self.diarys의 데이터를 수정하면 내부적으로 tableView.reloadData가 실행되도록 설정해놓았다.
그래서 Delegate를 실행한 후에도 이와같이 리로드를 해줄 것으로 예상되기때문에 데이터전달 만해주고 값을 바꿔주었는데 
MainView에 반영이 되질않았다. 한참을 의심하다가 디버그해보니 tableViewDataSource메서드가 재실행이 되고 있지를 않았던것이다.
그래서 reload를 명시적으로 진행해주었다.

델리게이트를 실행할때는 왜 반영이 되질않는걸까 ?

### [didSet의 reloadData가 실행되지않았던 이유(추론)]
> 핵심은 인덱스의 값이 변경된것이아니라 배열의 내부의 값이 변경되었기때문에 didSet입장에서 인식을 못했던것이다.

forEach메서드로 Main에 있는 Diarys 내부의값을 변경해주었는데 didSet이 발동되지않았다 그이유는 [diary] 배열의 타입은 append했을때는 확실하게 새로운값이 추가됬다는걸 알았기때문에 didset이 발동이된다.
하지만 index의 크기 변동없이 그 내부의 값을 forEash로 변경했을때는 didSet입장에서는 변동사항을 감지하지 못했던것이다.
그래서 변경되지않았던것이다.


4-1. 충격적인 사실을 발견했다
델리게이트로 diary 값을 넘겨주고 나서 diary값을 업데이트 해주지않고 reloadData만 해줘도 값이 갱신이된다.
Diary 값이 원본은 참조하고 있어서 그런건가 확인을 해보았지만 그런이유는 아닌 것으로 판단했따.

reloadData와 CoreData값을 저장하는 diarys데이터와 어떤 연관이 존재하길래..이런 현상이 발생하는걸까 ?

reloadData가 CoreData를 불러와주기라도 하는걸까 ?

### [reloadData만으로 데이터 업데이트가 됬던 이유]
> 핵심은 참조때문이다.
diary는 class로 되어있기때문에 Detail -> Main 으로 변경된값을 가지고갈때 CoreData에 저장을 한 후에 들고 나간다. 굳이 변경된 값을 가지고 갈 필요가 없고 참조되어있기때문에 tableView를 reloadData만 해줘도 데이터가 업데이트가 되었떤것이다.


## [STEP3]

# 📆타임라인
- 월 - CoreLocation, Migration, 
- 화 - WeatherAPI를 활용하여 날씨정보 가져오기
- 수 - 가져온 날씨정보를 활용하여 날씨 아이콘 이미지 가져오기
- 목 - 날씨 아이콘 레이아웃 적용
- 금 - EndPoint로 리팩토링

# 🧐고민한점
**이미지 불러오는 방식: 동기 비동기**

```swift
private func fetchImage(_ iconID: String) -> UIImage? {
    APIOption.iconID = iconID
    
    guard let url = URL(string: APIOption.iconURL) else {
      return nil
    }
    
    guard let iconData = try? Data(contentsOf: url) else {
      return nil
    }
    
    guard let iconImg = UIImage(data: iconData) else {
      return nil
      
    }
    return iconImg
  }
```
> 이와 같은 동기 방식으로 이미지를 가져올 경우 cell에서 업데이트 하는 과정이 매우 렉이 심했었다.
하지만 현재는
```swift
  func fetch(api: Endpoint,
                  completion: @escaping (Result<Data, NetworkError>) -> Void) {
    guard let url = api.url else {
      return completion(.failure(.wrongRequest))
    }
    
    URLSession.shared.dataTask(with: url) { data, reponse, error in
      guard error == nil else {
        return completion(.failure(.wrongRequest))
      }
      
      guard let httpResponse = (reponse as? HTTPURLResponse),
            (200...300).contains(httpResponse.statusCode) else {
        return completion(.failure(.wrongResponse))
      }
      
      guard let data = data else {
        return completion(.failure(.wrongResponse))
      }
      
      completion(.success(data))
    }.resume()
  }

```
```swift
WeatherService().fetch(api: .iconImage(iconID: iconID)) { result in
      switch result {
      case .success(let data):
        DispatchQueue.main.async {
          self.iconImageView.image = UIImage(data: data)
        }
      case .failure(_): break
      }
    }
```
URLSession으로 Data를 불러오는 방식은 비동기 방식이기 때문에 렉이 걸리지 않습니다!


**core Location을 확인하는 시점: MainScene or WriteScene**

> coreLocation을 확인하는 시점을 처음 생각했을때 앱을 킬 경우라고 생각하여 MainScene에서 위치허용 알림을 보여줄 생각이였다. 그래서 
```swift
@objc private func addButtonDidTap() {
    guard let lat = locationManager.location?.coordinate.latitude,
          let lon = locationManager.location?.coordinate.longitude else {
      return
    }

    let detailViewController = WriteViewController(latitude: lat, longitude: lon)
    navigationController?.pushViewController(detailViewController, animated: true)
  }

  private func setlocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.stopUpdatingLocation()
    navigationController?.pushViewController(WriteViewController(), animated: true)
  }
```
> 이와 같이 mainView에서 WriteView으로 넘어갈때 coreLocationManager를 통해 얻은 위도와 경도 값을 WriteView으로 넘겨주는 방식을 선택했었다. 그러나 WriteScene에서 일기를 등록할때 위치허용 알림을 보여주는 것이 더 타당하다는 결론이 나와서 위와같이 위도와 경도 값을 넘겨줄 필요없이 WriteView에서 바로 coreLocationManager를 사용하였다.

# 📛TroubleShooting

**ContentHugging **
![](https://i.imgur.com/tn5iShG.gif)
> cell을 클릭했다가 나올면 dateLabel크기가 변하는 문제가 있었다 이 문제는 dateLabel과 imageView 등을 stackView에 넣어두고 있어서 dateLabel, imageView 등의 width를 결정하는 과정에서 나타난 문제로 판단되어 ContentHugging을 조절하여 문제를 해결 하였다.

**ATS(App Transport Security)**

![](https://i.imgur.com/1MnPWpV.png)

> http 네트워크 통신에러: 검색을 통해 ATS(App Transport Sercurity)는 iOS 9 버전 이후부터 적용된 보안정책으로, 보안에 취약한 네트워크를 차단시킨다는걸 알게되었다. https는 암호화가된거고 http는 암호화가 없어서 보안에 취약하기에 애플이 기본값으로 막은 것으로 확인했다. Info.list에 Alllow Arbitrary Loads Key와 Yes(Bool) value를 추가하여 이 문제를 해결하였다.

****

## ✅ 그라운드 룰

### 활동시간
변동사항이 있으면 DM을 보내줄 것

#### 
- 오전 9시 ~ 22시 
- 점심시간 12시 30분 ~ 14시
- 저녁시간 6시 ~ 7시

---

### 공식 문서 및 세션 활동, 일정
- 전날 공부한 것을 공유
- 모르는 내용을 서로 묻기
- 숙지 완료가 되면 프로젝트 진행

---

### 코딩 컨벤션
#### 1. Swift 코드 스타일
[스타일가이드 컨벤션](https://github.com/StyleShare/swift-style-guide#%EC%A4%84%EB%B0%94%EA%BF%88)

#### 2. 커밋 메시지
#### 2-1. 커밋 Titie 규칙
```
feat: [기능] 새로운 기능 구현.
fix: [버그] 버그 오류 해결.
refactor: [리팩토링] 코드 리팩토링 / 전면 수정이 있을 때 사용합니다
style: [스타일] 코드 형식, 정렬, 주석 등의 변경 (코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
test: [테스트] 테스트 추가, 테스트 리팩토링(제품 코드 수정 없음, 테스트 코드에 관련된 모든 변경에 해당)
docs: [문서] 문서 수정 / README나 Wiki 등의 문서 개정.
chore: [환경설정] 코드 수정
file: [파일] 내부 파일 수정

```

#### 2-2. 커밋 Body 규칙
- 현재 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장
- 문장형으로 끝내지 않기
- subject와 body 사이는 한 줄 띄워 구분하기
- subject line의 글자수는 50자 이내로 제한하기
- subject line의 마지막에 마침표(.) 사용하지 않기
- body는 72자마다 줄 바꾸기
- body는 어떻게 보다 무엇을, 왜 에 맞춰 작성하기

