FROM python:3.11-slim

WORKDIR /app

# Install dependencies in a separate layer for better cache reuse
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["uvicorn", "app:app", "--host", "[IP_ADDRESS]", "--port", "${PORT:-8080}"]
