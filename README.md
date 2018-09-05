# chef

## 競技開始時にすること

- set-host.sh にインスタンスのIPを全て登録
- appユーザがなんていう名前か確認して、Makefile と roles/base.json の app_user を適切な値にする
- appユーザがwheelになかったらwheelに追加
- isu1に入る
  - git clone git@github.com:dozen/isucon7q.git
  - sudo ./chef-install.sh && sudo ./run-chef.sh
  - cd ~/
  - isucon7qを全台に配って、sshで入ってchef回してくる
    - rsync -av --exclude='.git' isucon7q isu2:
    - ssh isu2 'cd isucon7q/chef && sudo ./chef-install.sh & sudo ./run-chef.sh'
