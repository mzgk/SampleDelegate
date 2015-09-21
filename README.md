# SampleDelegate
delegateの練習

- ParentViewControllerからModalViewControllerをmodal表示
- MoadalViewControllerで入力しボタンをタップ
- ParentViewControllerに入力した値を表示

## 依頼する側
- ModalViewController
- プロトコルの定義（ModalViewControllerDelegate）
- デリゲートメソッドの定義（func modalDidFinished(modalText: String)）
- デリゲートインスタンスの定義（var delegate: ModalViewControllerDelegate?）
- デリゲートメソッドの呼出し
```swift
@IBAction func tapSubmit(sender: UIButton) {
    /// 4.デリゲートメソッドの呼出し
    self.delegate?.modalDidFinished(inputField.text!)
}
```

## 依頼される側
- ParentViewController
- プロトコルに準拠（class ParentViewController: UIViewController, ModalViewControllerDelegate {）
- デリゲートインスタンスに自身をセット（modalView.delegate = self）
- デリゲートメソッドの実装（ModalViewから呼び出される）
```swift
/// 3.デリゲートメソッドの実装（ModalVC側からコールされる）
func modalDidFinished(modalText: String) {
    modalTextLabel.text = modalText
    self.modalView.dismissViewControllerAnimated(true, completion: nil)
}
```
