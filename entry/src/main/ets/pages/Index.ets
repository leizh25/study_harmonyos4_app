@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#36d')
          .onClick(e=>this.message = 'Hello ArkTS!')

      }
      .width('100%')
    }
    .height('100%')
  }
}