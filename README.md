# plusコマンド

![test](https://github.com/Ayaka0606/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ数字を足し、その合計を表示するプログラムです。

## 使用方法

```bash
seq 5 | ./plus
```

実行結果

```text
15
```

整数と小数の計算に対応しています。

計算できない文字が入力された場合や、入力がない場合は、終了ステータス1で終了します。

## 必要なソフトウェア

- Python
  - テスト済みバージョン：3.10〜3.14

## テスト環境

- Ubuntu 24.04 LTS
- GitHub Actions

## ライセンス

- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードは、下記の講義資料のコードを参考に作成しています。
  - https://github.com/tarolab-cit/lectures/tree/main/robosys2026
- © 2026 Ayaka Wakita
