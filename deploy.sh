# 커밋 메시지 입력 받기
read -p "커밋 메시지를 입력하세요: " user_message

 # 현재 시간 (KST 기준)
timestamp=$(TZ=Asia/Seoul date +"%Y-%m-%d %H:%M:%S (KST)")

 # 메시지 포맷: 메시지 | 날짜 (KST)
commit_message="$user_message | $timestamp"

 # Git 커밋 및 푸시
git add .
git commit -m "$commit_message"
git push
