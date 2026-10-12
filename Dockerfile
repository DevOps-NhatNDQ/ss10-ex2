# Sử dụng base image Alpine tinh gọn cho Node.js
FROM node:18-alpine

# Khai báo thư mục làm việc bên trong container
WORKDIR /app

# Biến môi trường xác định cổng lắng nghe của ứng dụng
ENV PORT=3000

# Copy file định nghĩa phụ thuộc trước để tối ưu hóa Docker layer cache
COPY package*.json ./

# Cài đặt các thư viện phụ thuộc (production dependencies)
RUN npm install --only=production

# Copy toàn bộ mã nguồn còn lại vào container
COPY . .

# Thông báo container lắng nghe ở port 3000
EXPOSE 3000

# Khởi chạy ứng dụng dưới dạng exec form
CMD ["node", "server.js"]