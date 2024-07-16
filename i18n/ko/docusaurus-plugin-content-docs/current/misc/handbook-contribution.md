---
sidebar_position: 20
---

# 기여 문서

:::tip
Warudo 문서 사이트가 이제 Github에 오픈 소스로 공개되었습니다!<br />
https://github.com/HakuyaLabs/warudo-docs/
:::

Warudo의 유연한 기능을 사용하는 동시에, 사용 난이도를 낮추기 위해 간단하고 이해하기 쉬운 문서와 튜토리얼이 필요합니다.

Warudo handbook는 React 기반의 [Docusaurus](https://docusaurus.io/)를 사용하며, 내용은 [Markdown](https://www.markdownguide.org/) 형식으로 작성되었습니다.
동시에 우리는 문서 페이지에 몇 가지 편리한 기능을 추가했으며, Warudo 소프트웨어의 기능 지원 및 안내에도 사용될 것입니다.

Warudo handbook는 오픈 소스이며, 이해하기 어려운 부분이 있거나 새로운 내용을 제공하고자 하는 경우 독점적인 튜토리얼과 가이드를 제공합니다
Github 이슈 및 디스코드에서 질문을 제기하거나 직접 Github 프로젝트에 코드를 제출하거나 번역에 기여할 수 있습니다. 당신의 이름은 문서 하단의 기여자 목록에 표시됩니다!

## 참여 기여

### Github Issue를 사용하여 문제를 피드백하고 의견을 제출하세요

깃허브 이슈를 통해 직접 피드백하는 것은 직접적이고 간단한 방법입니다. 우리는 몇 가지 이슈 템플릿을 설정하여 문제를 제기하는 데 도움을 줍니다.
https://github.com/HakuyaLabs/warudo-docs/issues

Warudo 문서에 대한 피드백이며, Warudo 소프트웨어 자체에 대한 토론은 관련 Discord 채널에서 연락하십시오.
https://discord.gg/warudo

### 코드를 제출하여 기여자가 되세요

만약 Git 및 프론트엔드 개발에 대한 지식이 있다면, Github에서 직접 Merge Request를 제출하여 코드를 기여할 수 있습니다.
이해하지 못해도 괜찮습니다. 아래 내용은 당신이 Warudo Handbook을 로컬에서 실행하고 수정할 수 있도록 안내합니다.
## 기술 세부 사항

### 디렉토리 구조

| 경로 | 내용 |
|--|--|
| `/docs` | 영어 문서 (주요) |
| `/i18n/zh/docusaurus-plugin-content-docs/current` | 中文文档 (번역) |
|/i18n/ko/docusaurus-plugin-content-docs/current| 한국어 문서 (번역) |

비영어 번역 버전의 디렉토리 구조는 영어 버전과 완전히 동일해야 하며, 언어 전환을 정확히 작동할 수 있도록 합니다.

:::tip

웹사이트 왼쪽 탐색기 구조 또한 영어 버전 파일에서 생성되었습니다. `/docs` 폴더의 각 파일을 `/i18n/[lang]/docusaurus-plugin-content-docs/current` 로 복사하시고, 각 파일의 구조가 다른 언어에서 완전히 일치하도록 하시기 바랍니다.

:::



### 자주 사용하는 명령

| 명령 | 설명 |
|--|--|
| `yarn` | 의존성 설치 |
| `yarn start:en` | 영어 문서 개발 모드 실행 |
| `yarn start:zh` | 중문 문서 개발 모드 실행 |
| `yarn start:jp` | 일본어 문서 개발 모드 실행 |
| `yarn start:ko` | 한국어 문서 개발 모드 실행 |
| `yarn start:all` | 여러 언어 문서를 동시에 다른 포트에서 실행합니다 |
| `yarn build` | 프로덕션 버전 빌드 |


## 로컬 런칭 문서 사이트 개발 환경

만약 개발용 도구들을 잘 익숙하지 않아도 걱정하지 마세요.

<details>

<summary>로컬 개발 문서 튜토리얼</summary>

### 준비 환경

먼저 필요한 개발 환경을 다운로드하세요.

 - Node.js 다운로드: https://nodejs.org/en/download/
	<small>Node.js는 문서 사이트에 필요한 프로그래밍 언어입니다.</small> <br />
	<small>LTS 버전 설치 선택 - 설치 프로그램(.msi/.exe은 Windows용, .pkg는 macOS용)</small> 

 - GitHub Desktop 다운로드: https://desktop.github.com/
    <small>GitHub Desktop는 GitHub의 공식 버전 관리 도구로, 코드를 직접 제출하거나 브랜치를 병합하는 데 도움을 줄 수 있습니다.</small>

 - VSCode 다운로드: https://code.visualstudio.com/
	<small>VSCode는 일반적인 편집기로, 프론트엔드 프로젝트를 개발하는 데 매우 적합하며 물론 다른 더 익숙한 편집기도 사용할 수 있습니다.</small>
### 명령줄 사용

 - Windows 사용자: `Win+R`을 눌러 `cmd`를 실행하여 터미널을 엽니다.

 - macOS 사용자: 런치패드에서 `Terminal` 앱을 사용합니다.

위의 개발 환경을 설치한 후에는 터미널에서 `node -v` 명령을 사용하여 현재 설치된 node.js 버전을 확인할 수 있습니다.

### Github Desktop에서 프로젝트 추가

 - Github 계정에 로그인합니다.

 - `HakuyaLabs/warudo-docs`를 검색합니다.

 - 프로젝트를 로컬에 클론합니다.
   <small>이제 문서 사이트의 코드가 당신의 컴퓨터에 다운로드되었습니다.</small>

 - `현재 분기` - `새 분기` - 당신의 분기 이름을 입력 - `분기 생성` 클릭    
   <small>분기는 Git의 개념으로, 당신은 자신의 분기에서 파일 내용을 수정하면서 다른 사람의 작업에 영향을 주지 않을 수 있습니다.</small>

 - `분기 게시` 클릭  
   <small>이제 당신의 분기가 게시되었고, 편집을 시작할 수 있습니다.</small>

### 로컬에서 사이트 실행

터미널을 열어 준비합니다:

 - **`cd <당신의 사이트 파일 경로>`**  
   <small>사이트 파일이 위치한 폴더로 이동합니다</small>

 - **`corepack enable`**   
   <small>Node.js의 패키지 관리자를 설정합니다</small><br />
   <small>*이 명령어는 이론상 한 번만 실행하면 되며, 이후 반복 실행할 필요는 없습니다*</small>

 - **`yarn`**  
   <small>의존 패키지를 설치합니다</small><br />
   <small>*프로젝트의 package.json 의존 파일이 업데이트될 때마다 이 명령어를 다시 실행하여 의존성을 설치해야 합니다.*</small>

 - **`yarn start:en`** 영어 문서 사이트 실행
   **`yarn start:zh`** 중국어 문서 사이트 실행
   **`yarn start:all`** 여러 언어의 문서 사이트를 한 번에 실행

이제 준비가 완료되어, 브라우저에서 당신의 컴퓨터에서 실행되는 문서 사이트를 확인할 수 있습니다.
문서 내용을 수정하고 저장하면 브라우저가 자동으로 페이지를 새로고침합니다.  
문서 내용을 편집해 보세요!
### 편집 시작

 - Markdown 파일을 편집하고 브라우저에서 실시간 페이지를 확인합니다.

대부분의 폴더에 있는 문서는 .md와 .mdx 형식으로 저장됩니다. 이는 [Markdown](https://www.markdownguide.org/) 형식의 텍스트로,   
대개는 설명 형식의 코드가 포함된 텍스트 파일입니다. 예쁘게 문서를 작성하고 싶다면, 좀 더 연구해보세요.

### 변경 사항 제출 및 업로드

먼저 저장한 후:

 - Github Desktop을 열면 왼쪽에서 모든 변경 사항을 볼 수 있습니다. 제출하고 싶은 변경 파일을 모두 선택합니다. 
   입력란에 이번 수정의 설명을 입력하세요 (예: 문서 xx 번역 추가) 후 제출 버튼을 클릭합니다.

 - 이번 수정이 제출되었습니다. 역사 목록에서 이번 제출을 확인할 수 있습니다.

 - 현재 이 수정 사항은 당신의 컴퓨터에만 있습니다. “Push Origin” 버튼을 클릭하여 Github에 업로드합니다.

 - 축하합니다! 당신의 첫 번째 제출을 완료했으며, 변경 사항이 저장되었습니다.

### Warudo Handbook 유지 보수 팀에 연락하여 수정 사항 검토 및 게시

 - Pull request를 제출하거나 그룹에서 문서 유지 보수 팀원에게 연락하여 수정 사항을 병합하고 게시합니다!

</details>

## 문서에 자신의 이름 추가하기

각 문서의 가장 아래에는 문서 편집자를 표시하는 코드가 있습니다. 문서를 수정하거나 완료한 후에는 여기에 자신의 이름을 추가하는 것을 잊지 마세요. 아바타는 자동으로 GitHub ID를 통해 가져옵니다.
```
<AuthorBar authors={{
  creators: [
    {name: '당신의 이름', github: '당신의 Github id'},
  ],
  translators: [
    {name: '당신의 이름', github: '당신의 Github id'},
  ],
}} />
```

<AuthorBar authors={{
  creators: [
    {name: 'Nekotora', github: 'Nekotora'},
  ],
  translators: [
  ],
}} />
