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