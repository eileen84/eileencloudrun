# 使用輕量版 Python 作為基礎映像
FROM python:3.11-slim

# 設定工作目錄
WORKDIR /app

# 複製需求檔案並安裝套件
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# 複製程式碼
COPY . .

# 設定服務執行入口
CMD ["python", "server.py"]

# Cloud Run 預設使用 $PORT 環境變數
ENV PORT 8080

# 開放對外 port
EXPOSE 8080