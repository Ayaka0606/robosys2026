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
# 4. deadbandの正常な入力
out=$(printf "0.01\n0.15\n-0.03\n0.50\n-0.12\n" | ./deadband 0.1)
expected=$(printf "0\n0.15\n0\n0.5\n-0.12")
[ "$out" = "$expected" ] || ng "$LINENO"

# 5. しきい値が指定されていない場合
out=$(./deadband 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

# 6. 不正なしきい値
out=$(./deadband abc 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

# 7. 負のしきい値
out=$(./deadband -0.1 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"
[ "${res}" = 0 ] && echo OK
exit $res
