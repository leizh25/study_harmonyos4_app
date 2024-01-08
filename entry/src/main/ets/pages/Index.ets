import router from '@ohos.router'

class RouterInfo {
  //   页面路径
  url: string
  //页面标题
  title: string

  constructor(url: string, title: string) {
    this.url = url
    this.title = title
  }
}

@Entry
@Component
struct Index {
  @State message: string = '页面列表'
  private routes: RouterInfo[] = [
    new RouterInfo('pages/imagePage', '图片查看案例'),
    new RouterInfo('pages/ItemPage', '商品列表案例'),
    new RouterInfo('pages/StatePage', 'Jack和他的女友案例'),
    new RouterInfo('pages/propPage', '任务列表案例')
  ]

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .height(80)

        List({ space: 10 }) {
          ForEach(this.routes, (item: RouterInfo, index: Number) => {
            ListItem() {
              this.RouterItem(item, index)
            }.width('100%')
          })
        }.padding(10).layoutWeight(1)

      }
      .width('100%')
    }
    .height('100%')
  }

  @Builder
  RouterItem(r: RouterInfo, i: Number) {
    Row() {
      Text(i + ".").fontSize(20).fontColor('#fff')
      Blank()
      Text(r.title).fontSize(20).fontColor("#fff")
    }
    .width('90%')
    .padding(12)
    .backgroundColor('#38f')
    .borderRadius(20)
    .onClick(e => {
      //router跳转
      router.pushUrl({ url: r.url, params: { id: i } }, router.RouterMode.Single, err => {
        if (err) console.log(`路由失败,errCode:${err.code},errMsg:${err.message}`)
      })
    })
  }
}