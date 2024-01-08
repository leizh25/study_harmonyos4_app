import { Header } from '../components/CommonComponent'

@Entry
@Component
struct Index {
  @State imageWidth: number = 150

  build() {
    Column() {
      Header({ title: '图片案例' })
      Row() {
        Image($r("app.media.icon"))
          .width(this.imageWidth)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
      .height('400')
      .justifyContent(FlexAlign.Center)

      Row() {
        Text($r("app.string.width_label")).fontSize(20).fontWeight(FontWeight.Bold)

        TextInput({ text: this.imageWidth.toFixed(0) })
          .width(150)
          .backgroundColor("#fff")
          .type(InputType.Number)
          .onChange(value => this.imageWidth = +value)
      }
      .width('100%')
      .padding({ left: 14, right: 14 })
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .width('90%')

      Row() {
        Button('缩小')
          .width(80)
          .fontSize(20)
          .onClick(e => (this.imageWidth >= 10) && (this.imageWidth -= 10))

        Button('放大')
          .width(80)
          .fontSize(20)
          .onClick(e => (this.imageWidth < 300) && (this.imageWidth += 10))
      }
      .width("100%")
      .margin({ top: 35, bottom: 35 })
      .justifyContent(FlexAlign.SpaceEvenly)


      Slider({ min: 100, max: 300, value: this.imageWidth, step: 10 })
        .width('100%')
        .blockColor('#36d')
        .trackThickness(7)
        .showTips(true)
        .onChange(value => this.imageWidth = value)
    }
    .width('100%')
    .height('100%')

  }
}