import router from '@ohos.router'

@Component
export struct Header {
  private title: ResourceStr
  @State params: any = router.getParams()

  build() {
    // 标题部分
    Row() {
      Image($r("app.media.ic_public_back")).width(30).onClick(e => {
      router.showAlertBeforeBackPage({
        message:"支付未完成,确定要完成吗?"
      })
        //返回
        router.back()
      })
      if (this.params && this.title) {
        Text(this.params.id + "." + this.title).fontSize(30).fontWeight(FontWeight.Bold)
      }
      Blank()
      Image($r("app.media.ic_public_refresh")).width(30)
    }
    .width('100%')
    .height(30)
  }
}