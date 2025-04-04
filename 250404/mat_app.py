import streamlit as st
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
import seaborn as sns
import matplotlib.font_manager as fm

def set_kor_font():
    plt.rcParams['font.family'] = 'Malgun Gothic' 
    plt.rcParams['axes.unicode_minus'] = False 
    sns.set(font='Malgun Gothic', 
            rc={'axes.unicode_minus' : False}, 
            style='darkgrid')

# 페이지 설정
st.set_page_config(page_title="Matplotlib & Seaborn 튜토리얼", layout="wide")
st.title("Matplotlib 튜토리얼")

# 데이터셋 불러오기
tips = sns.load_dataset('tips')

# 데이터 미리보기
st.subheader('데이터 미리보기')
st.dataframe(tips.head())

# 기본 막대 그래프, matplotlib + seaborn
st.subheader("1. 기본 막대 그래프")

# 객체지향방식으로 차트 작성하는 이유
# 그래프를 그리는 목적 : (예쁘게) 잘 나오려고
fig, ax = plt.subplots(figsize=(10,6))  # matplotlib(시각화 예쁘게)

sns.barplot(data=tips, x='day', y='total_bill', ax=ax)  # seaborn(통계와 관련된 시각화)

# matplotlib ######################
ax.set_title("요일별 평균 지불 금액")
ax.set_xlabel('요일')
ax.set_ylabel('평균 지불 금액($)')
###################################

# plt.show() ==> 문법은 juupyter lab, google colab에서 활용할 때 사용
st.pyplot(fig) # streamlit (시각화한 거 웹상에 띄워주기) 

# 산점도
# x축, y축이 연속형 변수
st.subheader("2. 산점도")
fig1, ax1 = plt.subplots(figsize=(10,6))
sns.barplot(data=tips, x='day', y='total_bill', ax=ax)
sns.scatterplot(data=tips, x='total_bill', y='tip',size='size', hue='day', ax=ax1)

st.pyplot(fig1)

# 히트맵
st.subheader("3. 히트맵")

# 요일과 시간별 평균 팁 계산
pivot_df = tips.pivot_table(values='tip', index='day', columns='time',aggfunc='mean')
fig2, ax2 = plt.subplots(figsize=(10,6))
sns.heatmap(pivot_df, annot=True, fmt='.2f', ax=ax2)
st.pyplot(fig2)

# 회귀선이 있는 산점도
st.subheader("4. 회귀선이 있는 산점도")
fig3, ax3 = plt.subplots(figsize=(10,6))
sns.regplot(data=tips, x='total_bill', y='tip', scatter_kws={'alpha':0.5}, ax=ax3)
st.pyplot(fig3)

# 박스플롯
st.subheader("5. 박스 플롯")
fig4, ax4 = plt.subplots()
sns.boxplot(x="day", y="total_bill", data=tips, ax=ax4)
ax4.set_title("Total Bill by Day")
st.pyplot(fig4)

# 1. 히스토그램: total_bill 분포
st.subheader("6. 히스토그램")
fig5, ax5 = plt.subplots()
sns.histplot(tips["total_bill"], bins=20, kde=True, ax=ax5)
ax5.set_title("Total Bill Distribution")
st.pyplot(fig5)


fig6, ax6 = plt.subplots(figsize=(10,6))
sns.barplot(data=tips, x='total_bill', y='sex', ax=ax6)
st.pyplot(fig6)
# ChatGPT 질문 던지기 : fig, ax = plt.subplots() 이런 방식으로 만드세요!!