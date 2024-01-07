class Item {
  name: string
  image: ResourceStr
  price: number
  discount: number

  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount
  }
}

@Entry
@Component
struct ItemPage {
  //商品数据
  private items: Array<Item> = [
    new Item('华为Mate90', "https://tse2-mm.cn.bing.net/th/id/OIP-C.j5vEHIFFAG_I1E_fEjZ4GAHaHa?w=179&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7", 9999, 100),
    new Item('matebook 13', "https://tse3-mm.cn.bing.net/th/id/OIP-C.RGpIwA3pgczBYTaD0fItygHaHa?w=174&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7", 8888),
    new Item('apple watch', "https://tse1-mm.cn.bing.net/th/id/OIP-C.KcoZHWDYEF-gKondSztTtAHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.5&pid=1.7", 7777),
    new Item('air pods', "https://tse1-mm.cn.bing.net/th/id/OIP-C.oZhAgHANB68gzjdV0-MYAgHaHa?w=184&h=184&c=7&r=0&o=5&dpr=1.5&pid=1.7", 6666),
    new Item('iphone 15', "https://tse3-mm.cn.bing.net/th/id/OIP-C.e9lZtx7IARHGLa1DUY22mwHaHa?w=176&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7", 5555),
    new Item('iphone 15', "https://tse3-mm.cn.bing.net/th/id/OIP-C.e9lZtx7IARHGLa1DUY22mwHaHa?w=176&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7", 5555),
  ]

  build() {
    Column({ space: 10 }) {
      Row() {
        Text("商品列表")
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(30)
      .margin({ bottom: 20 })

      List({ space: 8 }) {
        ForEach(this.items, (item: Item) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.image).width(100)
              Column({ space: 4 }) {
                if (item.discount) {
                  Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)
                  Text('原价:$ ' + item.price)
                    .fontColor('#f36')
                    .fontSize(14)
                    .fontColor("#ccc")
                    .decoration({ type: TextDecorationType.LineThrough })
                  Text('折扣价:$ ' + item.discount).fontColor('#f36').fontSize(18)
                  Text('补贴:$ ' + (item.price - item.discount)).fontColor('#f36').fontSize(18)
                } else {
                  Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)
                  Text('$ ' + item.price).fontColor('#f36').fontSize(18)
                }
              }
              .height('100%')
              .alignItems(HorizontalAlign.Start)
            }
            .width("100%")
            .backgroundColor("#fff")
            .borderRadius(20)
            .height(120)
            .padding(10)
          }
        })
      }
      .width('100%')
      .layoutWeight(1)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#efefef')
    .padding(20)
  }
}