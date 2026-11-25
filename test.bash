#!/bin/bash
# SPDX-FileCopyrightText: 2026 Ayaka Wakida
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目のテスト失敗
    res=1
}

res=0

# 1. deadbandの正常な入力
out=$(printf "0.01\n0.15\n-0.03\n0.50\n-0.12\n" | ./deadband 0.1)
expected=$(printf "0\n0.15\n0\n0.5\n-0.12")
[ "$out" = "$expected" ] || ng "$LINENO"

# 2. しきい値が指定されていない場合
out=$(./deadband 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

# 3. 不正なしきい値
out=$(./deadband abc 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"

# 4. 負のしきい値
out=$(./deadband -0.1 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"
# 5. しきい値と同じ値
out=$(printf "0.1\n-0.1\n0.099\n" | ./deadband 0.1)
expected=$(printf "0.1\n-0.1\n0")
[ "$out" = "$expected" ] || ng "$LINENO"

# 6. 数値以外の入力
out=$(printf "0.1\nabc\n0.3\n" | ./deadband 0.1 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"
[ "$out" = "0.1" ] || ng "$LINENO"

# 7. 空入力
out=$(./deadband 0.1 < /dev/null)
[ "$?" = 0 ] || ng "$LINENO"
[ -z "$out" ] || ng "$LINENO"
[ "${res}" = 0 ] && echo OK
exit $res
