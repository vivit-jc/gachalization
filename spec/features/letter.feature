# encoding: utf-8
# language: ja
機能: 交易
  背景:
    前提 ログインする
    前提 home にアクセス
    前提 ■他プレイヤーを追加

  シナリオ: 書簡を出す
    もし div sidebar のリンク 書簡 をクリック
    ならば "letter/index" を表示する
    もし リンク 書簡を作成 をクリック
    ならば "letter/new" を表示する
    もし メニューから country2 を選択
    かつ text に texttexttext を入力
    かつ ラジオボタンから letter を選択
    かつ 送信 ボタンをクリック
    ならば "letter/index" を表示する
    かつ texttexttext が表示される #送信済み書簡が表示されることを確認

  シナリオ: 書簡を読む
    pending

  シナリオ: 相互通商条約の提案を出す
    pending

  シナリオ: 条約の提案を出す
    pending

  シナリオ: 条約を許諾する
    pending

  シナリオ: カードを譲渡する
    pending

  シナリオ: 譲渡されたカードを受け取る
    pending