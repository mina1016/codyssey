## 1. 실행 환경

- OS: macOS (Darwin 24.6.0)
- Architecture: x86_64
- Shell: /bin/zsh
- Terminal: VSCode Terminal
- Docker Engine: 28.5.2 (OrbStack)
- Docker Context: orbstack
- Git: 2.53.0

## 2. 터미널 기본 조작 로그

```bash
# 현재 위치 확인
$ pwd
/Users/lovemina10167073/Public

# 파일 및 폴더 목록 확인
$ ls
codyssey-docker-practice
terminal-practice

# 숨김 파일 포함 목록 확인
$ ls -la
total 0
drwxr-xr-x+  4 lovemina10167073  lovemina10167073  128 Jul 28 15:34 .
drwxr-x---+ 21 lovemina10167073  lovemina10167073  672 Jul 28 15:35 ..
drwxr-xr-x   7 lovemina10167073  lovemina10167073  224 Jul 28 15:15 codyssey-docker-practice
drwxr-xr-x   4 lovemina10167073  lovemina10167073  128 Jul 28 15:34 terminal-practice

# 디렉터리 생성
$ mkdir terminal-practice
mkdir: terminal-practice: File exists

# 디렉터리 이동
$ cd terminal-practice

# 빈 파일 생성
$ touch empty.txt

# 파일 생성 및 내용 작성
$ echo "hello terminal" > note.txt

# 파일 내용 확인
$ cat note.txt
hello terminal

# 파일 복사
$ cp note.txt note-copy.txt

# 파일 이름 변경
$ mv note-copy.txt renamed-note.txt

# 파일 삭제
$ rm renamed-note.txt

# 상위 디렉터리로 이동
$ cd ..
```

## 3. 파일 및 디렉터리 권한 실습

### 3-1. 파일 권한 변경

```bash
# 파일 생성
$ touch script.sh

# 초기 권한 확인
$ ls -l script.sh
-rw-r--r--  1 lovemina10167073  lovemina10167073  0 Jul 28 15:44 script.sh

# 권한 변경 (644)
$ chmod 644 script.sh

$ ls -l script.sh
-rw-r--r--  1 lovemina10167073  lovemina10167073  0 Jul 28 15:44 script.sh

# 권한 변경 (755)
$ chmod 755 script.sh

$ ls -l script.sh
-rwxr-xr-x  1 lovemina10167073  lovemina10167073  0 Jul 28 15:44 script.sh
```

### 결과 분석

|권한|의미|
|---|---|
|644 (`-rw-r--r--`)|소유자는 읽기(r), 쓰기(w) 가능 / 그룹과 기타 사용자는 읽기(r)만 가능|
|755 (`-rwxr-xr-x`)|소유자는 읽기(r), 쓰기(w), 실행(x) 가능 / 그룹과 기타 사용자는 읽기(r), 실행(x) 가능|

---

### 3-2. 디렉터리 권한 변경

```bash
# 디렉터리 생성
$ mkdir test-dir

# 초기 권한 확인
$ ls -ld test-dir
drwxr-xr-x  2 lovemina10167073  lovemina10167073  64 Jul 28 15:44 test-dir

# 권한 변경 (755)
$ chmod 755 test-dir

$ ls -ld test-dir
drwxr-xr-x  2 lovemina10167073  lovemina10167073  64 Jul 28 15:44 test-dir

# 권한 변경 (700)
$ chmod 700 test-dir

$ ls -ld test-dir
drwx------  2 lovemina10167073  lovemina10167073  64 Jul 28 15:44 test-dir
```

### 결과 분석

|권한|의미|
|---|---|
|755 (`drwxr-xr-x`)|소유자는 읽기(r), 쓰기(w), 진입(x) 가능 / 그룹과 기타 사용자는 읽기(r), 진입(x) 가능|
|700 (`drwx------`)|소유자만 읽기(r), 쓰기(w), 진입(x) 가능 / 그룹과 기타 사용자는 접근 불가|

---

### 학습 내용

- `r(Read)` : 파일을 읽거나 디렉터리의 목록을 확인할 수 있는 권한
- `w(Write)` : 파일을 수정하거나 디렉터리 내부에 파일을 생성·삭제할 수 있는 권한
- `x(Execute)` :
  - **파일**에서는 실행 권한을 의미한다.
  - **디렉터리**에서는 해당 디렉터리로 `cd` 하여 **진입할 수 있는 권한**을 의미한다.
- `644`는 일반 파일에서 많이 사용되는 권한이며, 소유자는 읽기/쓰기 가능하고 그룹과 기타 사용자는 읽기만 가능하다.
- `755`는 실행 파일이나 디렉터리에서 많이 사용되는 권한이며, 소유자는 모든 권한을 가지고 그룹과 기타 사용자는 읽기와 실행 권한을 가진다.
- `700`은 소유자만 접근할 수 있는 권한으로, 그룹과 기타 사용자의 접근을 모두 차단한다.

## 4. Docker 운영/검증 로그

### Docker 버전 확인

```bash
$ docker --version
Docker version 28.5.2, build ecc6942
```

### Docker 정보 확인

```bash
$ docker info

Context: orbstack
Server Version: 28.5.2
Operating System: OrbStack
OSType: linux
Architecture: x86_64
CPUs: 6
Total Memory: 15.67GiB
Storage Driver: overlay2
Containers: 0
Images: 0
```

### 이미지 확인

```bash
$ docker images

REPOSITORY   TAG   IMAGE ID   CREATED   SIZE
```

→ 현재 저장된 Docker 이미지 없음

### 컨테이너 확인

```bash
$ docker ps -a

CONTAINER ID   IMAGE   COMMAND   CREATED   STATUS   PORTS   NAMES
```

→ 현재 생성된 컨테이너 없음

## 5. 컨테이너 실행 실습

### 5-1. hello-world 컨테이너 실행

#### 실행 명령어

```bash
docker run hello-world
```

#### 실행 결과

```text
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.
```

#### 확인 내용

- Docker Hub에서 `hello-world` 이미지를 자동으로 다운로드하였다.
- 다운로드한 이미지로 컨테이너를 생성하였다.
- 컨테이너가 정상적으로 실행되어 `Hello from Docker!` 메시지를 출력하였다.
- 작업이 끝난 후 컨테이너는 자동으로 종료(Exited)되었다.

---

### 5-2. Ubuntu 컨테이너 실행 및 내부 진입

#### 실행 명령어

```bash
docker run -it --name ubuntu-test ubuntu bash
```

#### 컨테이너 내부 명령 실행

```bash
ls
echo "hello from ubuntu container"
exit
```

#### 실행 결과

```text
root@3c265b5fbf90:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt
proc  root  run  sbin  srv  sys  tmp  usr  var

root@3c265b5fbf90:/# echo "hello from ubuntu container"
hello from ubuntu container

root@3c265b5fbf90:/# exit
```

#### 확인 내용

- Ubuntu 이미지를 다운로드하여 컨테이너를 생성하였다.
- Bash 셸에 접속하여 Linux 명령어(`ls`, `echo`)를 실행하였다.
- `exit` 명령으로 컨테이너를 종료하였다.

---

### 5-3. 컨테이너 상태 확인

#### 실행 명령어

```bash
docker ps -a
```

#### 실행 결과

```text
CONTAINER ID   IMAGE         STATUS
3c265b5fbf90   ubuntu        Exited (0)
00d62585720e   hello-world   Exited (0)
```

#### 확인 내용

- `hello-world` 컨테이너와 `ubuntu-test` 컨테이너가 모두 실행을 마친 후 `Exited` 상태가 되었다.

---

### 5-4. 실행 중인 컨테이너에 다시 접속

#### 실행 명령어

```bash
docker run -d --name ubuntu-sleep ubuntu sleep infinity
docker exec -it ubuntu-sleep bash
```

#### 확인 내용

- `sleep infinity` 명령으로 컨테이너를 계속 실행 상태로 유지하였다.
- `docker exec -it` 명령을 사용하여 실행 중인 컨테이너 내부 Bash에 접속하였다.
- 기존 컨테이너를 종료하지 않고 여러 번 내부에 접속할 수 있음을 확인하였다.

---

## 5-5. attach와 exec 차이

| 명령어 | 설명 |
|--------|------|
| `docker attach` | 컨테이너의 **기존 메인 프로세스**에 연결한다. 종료하면 컨테이너도 함께 종료될 수 있다. |
| `docker exec -it` | 실행 중인 컨테이너 안에서 **새로운 Bash 프로세스**를 실행한다. 가장 많이 사용하는 방식이다. |

### 실습을 통해 확인한 내용

- `docker run ubuntu bash`는 Bash를 종료(`exit`)하면 컨테이너도 함께 종료된다.
- `docker run -d ubuntu sleep infinity`는 컨테이너가 계속 실행 상태를 유지한다.
- 실행 중인 컨테이너는 `docker exec -it` 명령으로 언제든지 다시 접속할 수 있다.
- 실무에서는 컨테이너 내부 작업을 위해 `docker exec -it`를 주로 사용한다.

## 증거
- [Dockerfile 작성/빌드 증거](./evidence/build.png)

# 6. Dockerfile 작성 및 커스텀 이미지 빌드

## 6-1. 실습 개요

Dockerfile을 작성하여 NGINX 기반의 커스텀 웹 서버 이미지를 만들고,  
컨테이너로 실행하여 브라우저에서 웹 페이지가 정상적으로 출력되는지 확인하였다.

---

## 6-2. 프로젝트 구조

```text
docker-web/
├── Dockerfile
└── app/
    └── index.html
```

---

## 6-3. Dockerfile 작성

```dockerfile
FROM nginx:alpine

LABEL maintainer="student"
LABEL description="Custom NGINX image for Docker practice"

COPY app/ /usr/share/nginx/html/

EXPOSE 80
```

---

## 6-4. Dockerfile 구성 설명

### 4-1. 베이스 이미지 설정

```dockerfile
FROM nginx:alpine
```

- Alpine Linux 기반의 가벼운 NGINX 이미지를 베이스 이미지로 사용하였다.

### 4-2. 이미지 메타데이터 추가

```dockerfile
LABEL maintainer="student"
LABEL description="Custom NGINX image for Docker practice"
```

- 이미지 작성자와 설명 정보를 추가하였다.

### 4-3. HTML 파일 복사

```dockerfile
COPY app/ /usr/share/nginx/html/
```

- `app` 폴더의 HTML 파일을 NGINX의 기본 웹 루트 디렉터리인 `/usr/share/nginx/html/`로 복사하였다.

### 4-4. 포트 설정

```dockerfile
EXPOSE 80
```

- 컨테이너가 HTTP 기본 포트인 80번 포트를 사용함을 명시하였다.

---

## 6-5. index.html 작성

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Codyssey Docker Practice</title>
</head>
<body>
  <h1>Hello Docker Custom Image!</h1>
  <p>This page is served by a custom NGINX Docker image.</p>
</body>
</html>
```

---

## 6-6. Docker 이미지 빌드

### 실행 명령어

```bash
docker build -t codyssey-nginx:1.0 .
```

### 실행 결과

```text
[+] Building 6.8s (7/7) FINISHED                          docker:orbstack
 => [internal] load build definition from Dockerfile
 => => transferring dockerfile: 189B
 => [internal] load metadata for docker.io/library/nginx:alpine
 => [internal] load .dockerignore
 => => transferring context: 2B
 => [internal] load build context
 => => transferring context: 297B
 => [1/2] FROM docker.io/library/nginx:alpine
 => [2/2] COPY app/ /usr/share/nginx/html/
 => exporting to image
 => => exporting layers
 => => writing image sha256:3a8bbf7454d7cd9c5a36a83441f45c20f3b7440
 => => naming to docker.io/library/codyssey-nginx:1.0
```

Dockerfile을 기반으로 `codyssey-nginx:1.0` 이미지가 정상적으로 빌드되었다.

---

## 6-7. Docker 이미지 확인

### 실행 명령어

```bash
docker images
```

### 실행 결과

```text
REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
codyssey-nginx   1.0       3a8bbf7454d7   10 seconds ago   62.4MB
ubuntu           latest    de7345b16e94   2 weeks ago      100MB
hello-world      latest    e2ac70e7319a   4 months ago     10.1kB
```

`codyssey-nginx` 이미지가 `1.0` 태그로 생성된 것을 확인하였다.

---

## 6-8. 컨테이너 실행

### 실행 명령어

```bash
docker run -d -p 8080:80 --name codyssey-web codyssey-nginx:1.0
```

### 실행 결과

```text
37eee9327f40f54c12985f49cbe341b333381f0c6826a6359b1f44bfff8f6152
```

컨테이너가 백그라운드 모드로 실행되었다.

---

## 6-9. 실행 중인 컨테이너 확인

### 실행 명령어

```bash
docker ps
```

### 실행 결과

```text
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS                                     NAMES
37eee9327f40   codyssey-nginx:1.0   "/docker-entrypoint.…"   9 seconds ago   Up 8 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   codyssey-web
```

컨테이너 `codyssey-web`이 실행 중이며,  
호스트의 `8080` 포트가 컨테이너의 `80` 포트와 연결된 것을 확인하였다.

---

## 6-10. 브라우저 접속 확인

### 접속 주소

```text
http://localhost:8080
```

### 화면 출력 결과

```text
Hello Docker Custom Image!

This page is served by a custom NGINX Docker image.
```

브라우저에서 `http://localhost:8080`으로 접속했을 때,  
작성한 `index.html`의 내용이 정상적으로 출력되었다.

---

## 6-11. 정리

이번 실습을 통해 Dockerfile을 사용하여 커스텀 Docker 이미지를 생성하고,  
해당 이미지를 컨테이너로 실행하여 웹 서버로 동작시키는 과정을 확인하였다.

특히 `COPY` 명령어를 통해 로컬 HTML 파일을 NGINX 웹 루트로 복사하고,  
`-p 8080:80` 옵션을 사용하여 호스트의 8080번 포트와 컨테이너의 80번 포트를 연결하는 방법을 실습하였다.

최종적으로 브라우저에서 `http://localhost:8080`에 접속하여  
커스텀 NGINX 이미지가 정상적으로 동작함을 확인하였다.

## 증거
-[컨테이너 실행 및 포트 매핑 증거](./evidence/docker-ps-result.png)
-[브라우저 접속 결과] (./evidence/port-mapping.png)

