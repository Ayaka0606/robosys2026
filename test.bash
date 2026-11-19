#!/bin/bash
# SPDX-FileCopyrightText: 2026 Ayaka Wakida
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目のテスト失敗
    res=1
}

res=0

# 1. 正常な入力
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

# 2. 計算できない文字
out=$(echo あ | ./plus)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

# 3. 空入力
out=$(./plus < /dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
