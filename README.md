# deadbandコマンド

![test](https://github.com/Ayaka0606/robosys2026/actions/workflows/test.yml/badge.svg)

標準入力から読み込んだ数値のうち、指定したしきい値より絶対値が小さい数値を0に置き換えるプログラムです。センサの測定値に含まれる小さなノイズを取り除くことを目的としています。

## 使用方法

### ダウンロード

```bash
git clone https://github.com/Ayaka0606/robosys2026.git
cd robosys2026
```

### deadbandコマンド

引数にしきい値を指定し、標準入力から数値を入力します。

```bash
$ printf "0.01\n0.15\n-0.03\n0.50\n-0.12\n" | ./deadband 0.1
```

実行結果

```text
0
0.15
0
0.5
-0.12
```

指定したしきい値より絶対値が小さい数値は0に置き換えられ、それ以外の数値はそのまま出力されます。

しきい値が指定されていない場合や、負のしきい値、数値以外の入力があった場合は、エラーを標準エラー出力に表示して終了します。


## 必要なソフトウェア

- Python
  - テスト済みバージョン：3.10～3.14

## テスト環境

- Ubuntu 24.04 LTS
- GitHub Actions

test.bash を使用して、deadbandコマンドの正常な入力およびエラー処理を確認しています。

GitHub Actionsでは、Python 3.10、3.11、3.12、3.13、3.14の5つのバージョンでテストを実行しています。

## ライセンス・謝辞

- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- このパッケージのコードは、下記の講義資料のコードを参考に作成しています。

  https://github.com/tarolab-cit/lectures/tree/main/robosys2026

- 著作権：© 2026 Ayaka Wakida
