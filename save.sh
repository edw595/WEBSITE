#!/bin/bash

MESSAGE="$1"

if [ -z "$MESSAGE" ]; then
  echo '用法：./save.sh "修改內容"'
  exit 1
fi

echo "📦 加入修改..."
git add .

if git diff --cached --quiet; then
  echo "❌ 沒有新的修改可以保存。"
  exit 1
fi

echo "📝 Commit: $MESSAGE"
git commit -m "$MESSAGE" || exit 1

echo "☁️ Push 到 GitHub..."
git push origin main || exit 1

echo ""
echo "✅ 完成！GitHub 已更新。"
