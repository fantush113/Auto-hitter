# Base image
FROM python:3.11-slim

# Environment settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Working directory
WORKDIR /app

# System dependencies (अगर future में जरूरत पड़े)
RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Install Python dependencies
# अगर requirements.txt नहीं है तो common libs install करेगा
RUN pip install --no-cache-dir --upgrade pip \
    && if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Default command
CMD ["python", "main.py"]
