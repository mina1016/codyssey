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

## 6. Dockerfile 작성 및 커스텀 이미지 빌드

### 6-1. 실습 개요

Dockerfile을 작성하여 NGINX 기반의 커스텀 웹 서버 이미지를 만들고,  
컨테이너로 실행하여 브라우저에서 웹 페이지가 정상적으로 출력되는지 확인하였다.

---

### 6-2. 프로젝트 구조

```text
docker-web/
├── Dockerfile
└── app/
    └── index.html
```

---

### 6-3. Dockerfile 작성

```dockerfile
FROM nginx:alpine

LABEL maintainer="student"
LABEL description="Custom NGINX image for Docker practice"

COPY app/ /usr/share/nginx/html/

EXPOSE 80
```

---

### 6-4. Dockerfile 구성 설명

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
-[브라우저 접속 결과](./evidence/port-mapping.png)

## 7. Docker 포트 매핑 및 데이터 영속성 검증
### 7-1. 포트 매핑 (Port Mapping)

Docker 컨테이너는 호스트와 분리된 네트워크 환경에서 실행된다.  
NGINX는 컨테이너 내부에서 기본적으로 `80번 포트`를 사용하지만, 호스트 브라우저에서는 직접 접근할 수 없다.

따라서 Docker의 포트 매핑 기능을 사용하여 호스트 포트와 컨테이너 포트를 연결했다.

```bash
-p 8080:80

의미:

8080 : 호스트에서 접근하는 포트
80 : 컨테이너 내부 NGINX 포트

즉, 사용자는 아래 주소로 접속한다.

http://localhost:8080

요청 흐름:

Browser
   ↓
localhost:8080
   ↓
Docker Port Mapping
   ↓
NGINX Container :80
8-2. Bind Mount를 이용한 실시간 파일 반영 검증
Bind Mount란?

Bind Mount는 호스트의 특정 디렉토리를 컨테이너 내부 디렉토리에 직접 연결하는 방식이다.

이를 사용하면 컨테이너 이미지를 다시 빌드하지 않아도 호스트 파일 변경 사항이 즉시 컨테이너에 반영된다.

기존 컨테이너 제거
docker rm -f codyssey-web
호스트 파일 변경

호스트의 app/index.html 파일 수정:

cat > codyssey/app/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>Bind Mount Updated!</h1>
  <p>This content was changed on the host machine.</p>
</body>
</html>
EOF
변경 사항 반영 확인
curl http://localhost:8081

실행 결과:

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Bind Mount Test</title>
</head>
<body>
  <h1>Bind Mount Updated!</h1>
  <p>This content was changed on the host machine.</p>
</body>
</html>

결과적으로 호스트의 index.html 변경 사항이 컨테이너 내부 NGINX에 즉시 반영되는 것을 확인했다.

## 증거
-[바인드 마운트 캡쳐](./evidence/bind-mount-before-after.png)

8-3. Docker Volume 데이터 영속성 검증
목적

Docker Volume이 컨테이너 삭제 이후에도 데이터를 유지하는지 확인한다.

컨테이너 내부에 저장된 데이터는 컨테이너 삭제 시 함께 제거될 수 있지만,
Docker Volume을 사용하면 데이터를 컨테이너 생명주기와 분리하여 관리할 수 있다.

1. Docker Volume 생성
docker volume create codyssey-data

생성 확인:

docker volume ls
2. Volume 연결 컨테이너 실행
docker run -d \
--name vol-test \
-v codyssey-data:/data \
ubuntu sleep infinity

옵션 설명:

--name vol-test
컨테이너 이름 지정
-v codyssey-data:/data
Docker Volume codyssey-data를 컨테이너 /data에 연결
ubuntu
실행 이미지
sleep infinity
컨테이너가 종료되지 않도록 유지
3. Volume 내부 데이터 생성
docker exec vol-test bash -lc \
"echo 'hello persistent volume' > /data/hello.txt"

파일 확인:

docker exec vol-test bash -lc \
"cat /data/hello.txt"

결과:

hello persistent volume
4. 기존 컨테이너 삭제
docker rm -f vol-test

컨테이너는 삭제되었지만 Docker Volume은 유지된다.

5. 새로운 컨테이너에 동일 Volume 연결
docker run -d \
--name vol-test2 \
-v codyssey-data:/data \
ubuntu sleep infinity

기존 데이터 확인:

docker exec vol-test2 bash -lc \
"cat /data/hello.txt"

결과:

hello persistent volume
검증 결과

새로운 컨테이너에서도 이전 컨테이너에서 생성했던 데이터가 그대로 유지되는 것을 확인했다.

## 증거
-[도커 볼륩 캡쳐](./evidence/docker-volume.png)

결론

이번 실습을 통해 Docker의 두 가지 데이터 관리 방식을 확인했다.

Bind Mount
호스트 파일과 컨테이너 파일을 직접 연결
개발 환경에서 코드 변경 사항을 빠르게 반영할 때 유용
Docker Volume
컨테이너와 독립적으로 데이터를 저장
컨테이너 삭제 이후에도 데이터를 유지 가능
데이터베이스 등 영속성이 필요한 서비스에 적합

따라서 Docker 환경에서는 목적에 따라 Bind Mount와 Volume을 선택하여 사용할 수 있다.

## 8. Docker 운영 명령 로그 남기기

컨테이너 실행 후 웹 요청 로그와 리소스 사용량을 확인하였다.

### 8-1. NGINX 접근 로그 확인

#### 실행 명령어

```bash
docker logs bind-web
```

#### 실행 결과

```text
2026/07/29 04:10:55 [notice] 1#1: start worker process 34
2026/07/29 04:10:55 [notice] 1#1: start worker process 35
2026/07/29 04:10:55 [notice] 1#1: start worker process 36
192.168.215.1 - - [29/Jul/2026:04:11:09 +0000] "GET / HTTP/1.1" 200 227 "-" "curl/8.7.1" "-"
192.168.215.1 - - [29/Jul/2026:04:12:35 +0000] "GET / HTTP/1.1" 200 205 "-" "curl/8.7.1" "-"
192.168.215.1 - - [29/Jul/2026:04:12:53 +0000] "GET / HTTP/1.1" 200 205 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36" "-"
192.168.215.1 - - [29/Jul/2026:04:12:53 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost:8081/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36" "-"
2026/07/29 04:12:53 [error] 34#34: *3 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 192.168.215.1, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "localhost:8081", referrer: "http://localhost:8081/"
```

브라우저와 curl 요청이 정상적으로 기록되었으며, favicon.ico 파일이 없어 404가 발생한 것도 확인하였다.

### 8-2. 컨테이너 리소스 사용량 확인

#### 실행 명령어

```bash
docker stats --no-stream
```

#### 실행 결과

```text
CONTAINER ID   NAME           CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
69dba696f2c9   vol-test2      0.00%     1.789MiB / 15.67GiB   0.01%     830B / 126B       0B / 0B           1
448ca99663f9   bind-web       0.00%     4.996MiB / 15.67GiB   0.03%     4.69kB / 3.81kB   11.4MB / 8.19kB   7
37eee9327f40   codyssey-web   0.00%     5.043MiB / 15.67GiB   0.03%     3.98kB / 2.16kB   10.2MB / 8.19kB   7
```

`docker stats`는 실시간으로 계속 갱신되므로, 과제 기록용으로는 `--no-stream` 옵션을 사용하였다.

### 8-3. 정리

이번 확인을 통해 다음 사항을 점검하였다.

- `docker logs`로 NGINX 접근 로그 확인
- 브라우저 및 curl 요청 기록 확인
- favicon.ico 누락으로 인한 404 확인
- `docker stats --no-stream`으로 컨테이너별 리소스 사용량 기록

### 증거

- [Docker 운영 로그](./evidence/docker-logs.png)
- [Docker stats 결과](./evidence/docker-stats.png)

---

## 9. 트러블슈팅 2건 작성

### 9-1. 트러블슈팅 1: 포트 충돌

#### 문제

`docker run -p 8080:80` 실행 시 포트가 이미 사용 중이라는 오류가 발생하였다.

```text
docker: Error response from daemon: driver failed programming external connectivity
on endpoint codyssey-web2: Bind for 0.0.0.0:8080 failed: port is already allocated.
```

#### 원인 가설

기존 컨테이너가 호스트의 8080 포트를 이미 사용 중일 수 있다.

#### 확인

```bash
docker ps
```

실행 중인 컨테이너 목록에서 `0.0.0.0:8080->80/tcp`를 사용하는 컨테이너가 있는지 확인하였다.

#### 해결

기존 컨테이너를 삭제하거나 다른 포트를 사용하였다.

```bash
docker rm -f codyssey-web
docker run -d -p 8081:80 --name codyssey-web2 codyssey-nginx:1.0
```

#### 결과

포트 충돌 없이 컨테이너가 정상 실행되었고, 8081 포트로 접속 가능하였다.

### 9-2. 트러블슈팅 2: 컨테이너 이름 중복

#### 문제

컨테이너 실행 시 이미 같은 이름이 사용 중이라는 오류가 발생하였다.

```text
docker: Error response from daemon: Conflict. The container name "/bind-web" is
already in use by container "448ca99663f9". You have to remove (or rename) that
container to be able to reuse that name.
```

#### 원인 가설

이전에 생성한 컨테이너가 삭제되지 않고 남아 있었을 가능성이 있다.

#### 확인

```bash
docker ps -a
```

전체 컨테이너 목록에서 동일한 이름의 컨테이너가 존재하는지 확인하였다.

#### 해결

기존 컨테이너를 삭제한 뒤 다시 실행하였다.

```bash
docker rm -f bind-web
docker run -d -p 8081:80 --name bind-web -v "$(pwd)/app:/usr/share/nginx/html" nginx:alpine
```

#### 결과

이름 충돌 없이 컨테이너가 정상 생성 및 실행되었다.

---

## 10. Git 설정 및 GitHub/VSCode 연동

Git 사용자 정보와 기본 브랜치 설정을 완료한 뒤, GitHub 저장소 및 VSCode 연동을 확인하였다.
민감한 정보는 노출되지 않도록 일부 항목을 마스킹하였다.

### 10-1. Git 사용자 정보 및 기본 브랜치 설정 확인

#### 실행 명령어

```bash
git config --list
```

#### 실행 결과

```text
user.name=김민아
user.email=*** (개인정보 보호를 위해 마스킹)
init.defaultbranch=master
```

`git config --list` 결과를 통해 Git 사용자 정보와 기본 브랜치 설정이 적용된 것을 확인하였다.

### 10-2. GitHub 저장소 연동 확인

#### 실행 명령어

```bash
git remote -v
git status
```

#### 실행 결과

```text
origin  https://github.com/mina1016/codyssey.git (fetch)
origin  https://github.com/mina1016/codyssey.git (push)

On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   codyssey (modified content, untracked content)

no changes added to commit (use "git add" and/or "git commit -a")
```

원격 저장소 `origin`이 GitHub와 정상적으로 연결되어 있음을 확인하였다.

### 10-3. VSCode GitHub 로그인 및 연동

VSCode에서 GitHub 로그인 후 저장소 연동을 완료하였다.
연동 과정에서 비밀번호, 토큰 등 민감한 정보는 기록하지 않았다.

### 증거

- [VSCode GitHub 연동 화면](./evidence/vscode-github.png)

### 10-4. 정리

이번 과정을 통해 다음 사항을 확인하였다.

- Git 사용자 정보 설정 완료
- 기본 브랜치 설정 완료
- GitHub 원격 저장소 연결 확인
- VSCode GitHub 로그인 및 연동 완료