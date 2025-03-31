FROM python:3.9

RUN mkdir -p /opt/spark/jars/

RUN apt-get update && apt-get install -y wget unzip curl
RUN wget -qO- https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz | tar xvz -C /opt && \
    ln -s /opt/jdk-11.0.2/bin/java /usr/bin/java
RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.24.jar -P /opt/spark/jars/
RUN wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.2/hadoop-aws-3.3.2.jar -P /opt/spark/jars/
RUN wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.901/aws-java-sdk-bundle-1.11.901.jar -P /opt/spark/jars/


ENV JAVA_HOME=/opt/jdk-11.0.2
ENV PATH=$JAVA_HOME/bin:$PATH
ENV MINIO_ACCESS_KEY=${MINIO_ACCESS_KEY}
ENV MINIO_SECRET_KEY=${MINIO_SECRET_KEY}
ENV MINIO_ENDPOINT=${MINIO_ENDPOINT}

WORKDIR /app

COPY app/ .  
COPY requirements.txt .

RUN pip install -r requirements.txt

#Antes da execução se faz necessário criar o bucket desejado e incluir 
CMD ["bash", "-c", "python init_db.py && python generate_data.py --minio_path 'trusted/out' --minio_bucket 'sicoperative'"]



