# encoding: utf-8
# language: ja
機能: 交易
  背景:
    前提 ログインする
    前提 ■カード 剣士 を追加
    前提 home にアクセス

  シナリオ: カードを交易に出す
    もし カード 剣士 を持っている
    かつ div cards のリンク 交易 をクリック
    ならば "/cards/1/trade" を表示する
    かつ 剣士 と表示される

    もし price に 40 を入力
    かつ 交易に出す ボタンをクリック
    ならば "/" を表示する
    かつ div trades に 剣士 と表示される
    かつ div trades に 40 と表示される
    かつ カード 剣士 を持っていない

  シナリオ: 交易に出したカードの価格を変更する
    前提 div cards のリンク 交易 をクリック
    前提 price に 40 を入力
    前提 交易に出す ボタンをクリック

    もし div trades のリンク 修正 をクリック
    ならば "/trades/1/edit" を表示する

    もし trade_price に 30 を入力
    かつ 修正 ボタンをクリック
    ならば "/" を表示する
    かつ div trades に 30 と表示される

  シナリオ: 交易に出したカードを撤回し手元に戻す
    前提 div cards のリンク 交易 をクリック
    前提 price に 40 を入力
    前提 交易に出す ボタンをクリック

    もし div trades のリンク キャンセル をクリック
    ならば "/" を表示する
    かつ div trades に 剣士 と表示されない
    かつ カード 剣士 を持っている