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

import { Header } from "../components/CommonComponent"

// //全局自定义构建函数
// @Builder function ItemCard(item) {
//   Row({ space: 10 }) {
//     Image(item.image).width(100)
//     Column({ space: 4 }) {
//       if (item.discount) {
//         Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)
//         Text('原价:$ ' + item.price)
//           .fontColor('#f36')
//           .fontSize(14)
//           .fontColor("#ccc")
//           .decoration({ type: TextDecorationType.LineThrough })
//         Text('折扣价:$ ' + item.discount).fontColor('#f36').fontSize(18)
//         Text('补贴:$ ' + (item.price - item.discount)).fontColor('#f36').fontSize(18)
//       } else {
//         Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)
//         Text('$ ' + item.price).fontColor('#f36').fontSize(18)
//       }
//     }
//     .height('100%')
//     .alignItems(HorizontalAlign.Start)
//   }
//   .width("100%")
//   .backgroundColor("#fff")
//   .borderRadius(20)
//   .height(120)
//   .padding(10)
// }

// 全局自定义公共样式
// @Styles function fillScreen() {
//   .width('100%')
//   .height('100%')
//   .backgroundColor('#efefef')
//   .padding(20)
// }

//继承模式,只能写在全局
@Extend(Text) function priceText() {
  .fontColor('#f36').fontSize(18)
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
      // 标题部分
      Header({ title: '商品列表' }).margin({ bottom: 20 })

      List({ space: 8 }) {
        ForEach(this.items, (item: Item) => {
          ListItem() {
            this.ItemCard(item)
          }
        })
      }
      .width('100%')
      .layoutWeight(1)

    }
    .fillScreen()
  }


  //局部自定义构建函数
  @Builder ItemCard(item) {
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
          Text('折扣价:$ ' + item.discount).priceText()
          Text('补贴:$ ' + (item.price - item.discount)).priceText()
        } else {
          Text(item.name).fontSize(20).fontWeight(FontWeight.Bold)
          Text('$ ' + item.price).priceText()
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


  // 局部自定义公共样式
  @Styles fillScreen() {
    .width('100%')
    .height('100%')
    .backgroundColor('#efefef')
    .padding(20)
  }
}