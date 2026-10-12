## Các bước triển khai

### 1. Build Docker Image
```bash
docker build -t hw-backend:v1 .

```

### 2. Khởi chạy Container

Khởi chạy container chạy ngầm (`-d`), đặt tên container là `app-single-stage` và ánh xạ cổng máy chủ `8080` vào cổng `3000` của container:

```bash
docker run -d --name app-single-stage -p 8080:3000 hw-backend:v1

```

### 3. Kiểm tra trạng thái và Logs

```bash
docker ps
docker logs app-single-stage

```

### 4. Kiểm tra phản hồi API

```bash
curl -i http://localhost:8080/

```

### 5. Dọn dẹp môi trường thử nghiệm

```bash
docker stop app-single-stage
docker rm app-single-stage
docker rmi hw-backend:v1

```

### 4. Kết quả thực thi các lệnh kiểm tra

#### Lệnh 1: `docker build -t hw-backend:v1 .`
```bash
$ docker build -t hw-backend:v1 .
[+] Building 4.8s (10/10) FINISHED                                        docker:default
 => [internal] load build definition from Dockerfile                                0.0s
 => => transferring dockerfile: 520B                                                0.0s
 => [internal] load metadata for docker.io/library/node:18-alpine                   1.2s
 => [internal] load .dockerignore                                                   0.0s
 => => transferring context: 82B                                                    0.0s
 => [1/5] FROM docker.io/library/node:18-alpine@sha256:48cbd2...                    0.0s
 => [internal] load build context                                                   0.0s
 => => transferring context: 1.12kB                                                 0.0s
 => [2/5] WORKDIR /app                                                              0.1s
 => [3/5] COPY package*.json ./                                                     0.0s
 => [4/5] RUN npm install --only=production                                         3.2s
 => [5/5] COPY . .                                                                  0.0s
 => exporting to image                                                              0.2s
 => => exporting layers                                                             0.2s
 => => writing image sha256:d8c5211e4bf32189d2d094bfcfcb2bb4f31                     0.0s
 => => naming to docker.io/library/hw-backend:v1                                    0.0s

```

#### Lệnh 2: `docker run -d --name app-single-stage -p 8080:3000 hw-backend:v1`

```bash
$ docker run -d --name app-single-stage -p 8080:3000 hw-backend:v1
4f89d31ac460e872e42881fa693da27dce7e4f134907945d8b85ca29d901f4c7

```

#### Lệnh 3: `docker ps`

```bash
$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS         PORTS                                       NAMES
4f89d31ac460   hw-backend:v1   "node server.js"         4 seconds ago   Up 3 seconds   0.0.0.0:8080->3000/tcp, :::8080->3000/tcp   app-single-stage

```

#### Lệnh 4: `docker logs app-single-stage`

```bash
$ docker logs app-single-stage
Server listening on port 3000

```

#### Lệnh 5: `curl -i http://localhost:8080/`

```bash
$ curl -i http://localhost:8080/
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: application/json; charset=utf-8
Content-Length: 66
ETag: W/"42-4f3b7987"
Date: Mon, 12 Oct 2026 12:15:30 GMT
Connection: keep-alive
Keep-Alive: timeout=5

{"status":"success","message":"Hello from Docker Single-stage!"}

```