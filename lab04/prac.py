# import pandas as pd
# import pyodbc
# import pymysql
# import openpyxl

# class DB2EXCEL:
#     """
#     DB2EXCEL 클래스는 데이터베이스(MSSQL, MySQL)에 연결하여 쿼리를 실행하고,
#     결과를 pandas DataFrame으로 변환 후 Excel 파일로 저장할 수 있도록 도와줍니다.
    
#     주요 기능:
#     - 라이브러리 상태 및 버전 확인
#     - MSSQL 및 MySQL 데이터베이스 연결 및 쿼리 실행
#     - 쿼리 결과를 엑셀 파일로 저장
#     """

#     def __init__(self):
#         """클래스 초기화 시 필요한 정보 저장 또는 상태 확인"""
#         self._print_library_versions()

#     def _print_library_versions(self):
#         """설치된 주요 라이브러리의 버전을 출력합니다."""
#         print("pandas version:", pd.__version__)
#         print("pyodbc version:", pyodbc.version)
#         print("pymysql version:", pymysql.__version__)
#         print("openpyxl version:", openpyxl.__version__)

#     def query_mssql(self, server, database, user, password, query):
#         """
#         MSSQL에 연결하여 쿼리를 실행하고 결과를 DataFrame으로 반환합니다.

#         Parameters:
#         - server (str): MSSQL 서버 주소
#         - database (str): 데이터베이스 이름
#         - user (str): 사용자명
#         - password (str): 비밀번호
#         - query (str): 실행할 SQL 쿼리

#         Returns:
#         - DataFrame: 쿼리 결과
#         """
#         conn_str = f"DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={user};PWD={password}"
#         with pyodbc.connect(conn_str) as conn:
#             df = pd.read_sql(query, conn)
#         return df

#     def query_mysql(self, host, database, user, password, query):
#         """
#         MySQL에 연결하여 쿼리를 실행하고 결과를 DataFrame으로 반환합니다.

#         Parameters:
#         - host (str): MySQL 서버 주소
#         - database (str): 데이터베이스 이름
#         - user (str): 사용자명
#         - password (str): 비밀번호
#         - query (str): 실행할 SQL 쿼리

#         Returns:
#         - DataFrame: 쿼리 결과
#         """
#         conn = pymysql.connect(host=host, user=user, password=password, database=database, charset='utf8mb4')
#         try:
#             df = pd.read_sql(query, conn)
#         finally:
#             conn.close()
#         return df

#     def export_to_excel(self, df, filename):
#         """
#         DataFrame을 엑셀 파일로 저장합니다.

#         Parameters:
#         - df (DataFrame): 저장할 데이터프레임
#         - filename (str): 저장할 엑셀 파일 이름 (*.xlsx)
#         """
#         df.to_excel(filename, index=False)
#         print(f"Excel 파일로 저장 완료: {filename}")


# if __name__ == "__main__":
#     db = DB2EXCEL()
#     db._print_library_versions()
    
#     # db.query_mssql("DESKTOP-BGELFKJ\SQLEXPRESS", database, user, password, query)



import streamlit as st
import pandas as pd
import pyodbc
from io import BytesIO

def query_mssql(server, port, database, user, password, query):
    conn_str = (
        f"DRIVER={{ODBC Driver 17 for SQL Server}};"
        f"SERVER={server},{port};DATABASE={database};UID={user};PWD={password}"
    )
    with pyodbc.connect(conn_str) as conn:
        df = pd.read_sql(query, conn)
    return df

def to_excel_download(df):
    output = BytesIO()
    with pd.ExcelWriter(output, engine='openpyxl') as writer:
        df.to_excel(writer, index=False)
    output.seek(0)
    return output

# Streamlit UI
st.title("📊 DB2Excel Converter")

# Sidebar
st.sidebar.header("데이터베이스 설정")
db_type = st.sidebar.selectbox("데이터베이스 종류", ["mssql"])
server = st.sidebar.text_input("서버 주소", "127.0.0.1")
port = st.sidebar.text_input("포트", "1433")
database = st.sidebar.text_input("데이터베이스 이름", "BikeStores")
user = st.sidebar.text_input("사용자명", "evan.testar3")
password = st.sidebar.text_input("비밀번호", type="password")

# Query
st.subheader("SQL 쿼리 입력")
query = st.text_area("SQL 쿼리를 입력하세요", "SELECT * FROM production.brands")

# 실행
if st.sidebar.button("연결 테스트"):
    try:
        df = query_mssql(server, port, database, user, password, query)
        st.success("쿼리 성공 ✅")
        st.dataframe(df)

        # 엑셀 다운로드
        excel_file = to_excel_download(df)
        st.download_button(
            label="엑셀 파일 다운로드",
            data=excel_file,
            file_name="query_result.xlsx",
            mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        )

    except Exception as e:
        st.error(f"❌ 오류 발생: {e}")
