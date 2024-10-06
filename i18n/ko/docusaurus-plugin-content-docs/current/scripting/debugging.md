---
sidebar_position: 1000
---

# 디버깅

스크립트가 의도한 대로 작동하지 않나요? 여기 몇 가지 디버깅 팁이 있어요!

## Warudo 재시작

진부하게 들릴 수 있지만, Warudo를 재시작하면 많은 문제를 해결할 수 있어요. 특히, 모드나 스크립트가 핫 리로드될 때 문제가 발생할 수 있는데, 이럴 때는 먼저 재시작을 시도해 보세요.

## 로깅

Unity의 `Debug.Log`를 사용해서 콘솔에 메시지를 출력할 수 있어요. 로그 폴더는 **Menu → Open Logs Folder**를 통해 접근할 수 있어요. 현재 세션의 로그는 `Player.log` 파일에, 이전 세션의 로그는 `Player-prev.log` 파일에 기록돼요.

## 전체 빌드 로그 활성화

 [플러그인 모드](plugin-mod)를 만들고 있다면, Mod Settings 창에서 **Log Level**을 All로 설정하고 **Clear Console On Build**옵션을 해제하는 것을 추천해요:

![](/doc-img/en-mod-13.png)

[모드](../modding/mod-sdk#custom-scripts) 제작 문서도 참고해 보세요.

## 디스코드 참여하기

그래도 문제가 해결되지 않으면 [Discord](https://discord.gg/warudo)에서 도움을 요청하세요. **#plugins-scripting** 채널에서 스크립팅 관련 도움을 받을 수 있고, 경험 많은 분들이 문제 진단을 도와줄 거예요!

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
