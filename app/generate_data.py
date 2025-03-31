from pyspark.sql import SparkSession
import argparse

class DatabaseQuery:
    def __init__(self, jdbc_url, db_properties, minio_url, minio_access_key, minio_secret_key):
        self.jdbc_url = jdbc_url
        self.db_properties = db_properties
        self.minio_url = minio_url
        self.minio_access_key = minio_access_key
        self.minio_secret_key = minio_secret_key

        self.spark = SparkSession.builder \
            .appName("DatabaseQueryApp") \
            .config("spark.hadoop.fs.s3a.endpoint", self.minio_url) \
            .config("spark.hadoop.fs.s3a.access.key", self.minio_access_key) \
            .config("spark.hadoop.fs.s3a.secret.key", self.minio_secret_key) \
            .config("spark.hadoop.fs.s3a.path.style.access", "true") \
            .config("spark.hadoop.fs.s3a.connection.maximum", "100") \
            .config("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem") \
            .config("spark.hadoop.fs.s3a.aws.credentials.provider", "org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider") \
            .config("spark.jars", "/opt/spark/jars/postgresql-42.2.24.jar,/opt/spark/jars/hadoop-aws-3.3.2.jar,/opt/spark/jars/aws-java-sdk-bundle-1.11.901.jar") \
            .getOrCreate()

    def run_query(self, query):
        df = self.spark.read.jdbc(url=self.jdbc_url, table=f"({query}) as query", properties=self.db_properties)
        return df

    def save_to_minio(self, df, bucket_name, path):
        output_path = f"s3a://{bucket_name}/{path}/"
        df.coalesce(1).write.mode("overwrite").option("header", "true").csv(output_path)
        print(f"Arquivo salvo no minio em {output_path}")

def get_query():
    with open("scripts/final_query.sql", "r") as file:
        query = file.read()
    return query

def main():
    parser = argparse.ArgumentParser(description="Consulta a ser executada")
    parser.add_argument("--minio_path", required=True, help="caminho no minio")
    parser.add_argument("--minio_bucket", required=True, help="bucket no minio")
    args = parser.parse_args()

    jdbc_url = "jdbc:postgresql://postgres:5432/postgres"
    db_properties = {
        "user": "admin",
        "password": "admin",
        "driver": "org.postgresql.Driver"
    }

    minio_url = "http://minio:9000"
    minio_access_key = "admin"
    minio_secret_key = "admin123"
    minio_bucket = args.minio_bucket

    db_query = DatabaseQuery(jdbc_url, db_properties, minio_url, minio_access_key, minio_secret_key)

    query = get_query()

    df = db_query.run_query(query)

    db_query.save_to_minio(df, minio_bucket, args.minio_path)

if __name__ == "__main__":
    main()
