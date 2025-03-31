from db_config import get_connection

def create_tables():
    conn = get_connection()
    cur = conn.cursor()
    
    with open("/app/scripts/schema.sql", "r") as f:
        sql_script = f.read()
        cur.execute(sql_script)

    conn.commit()
    cur.close()
    conn.close()
    print("schema inicializado com sucesso!")

def insert_data():
    conn = get_connection()
    cur = conn.cursor()
    
    with open("/app/scripts/insert.sql", "r") as f:
        sql_script = f.read()
        cur.execute(sql_script)

    conn.commit()
    cur.close()
    conn.close()
    print("Fim da inserção de dados")   

if __name__ == "__main__":
    create_tables()
    insert_data()
