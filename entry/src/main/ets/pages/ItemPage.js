class Item {
    constructor(name, image, price, discount = 0) {
        this.name = name;
        this.image = image;
        this.price = price;
        this.discount = discount;
    }
}
import { Header } from "../components/CommonComponent";
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
function priceText() {
    
  
        .fontColor('#f36').fontSize(18);
}
struct ItemPage extends   {
    constructor() { }
    build() {
            .fillScreen();
    }
    //局部自定义构建函数
    ItemCard(item) {
            .width("100%")
            .backgroundColor("#fff")
            .borderRadius(20)
            .height(120)
            .padding(10);
    }
    // 局部自定义公共样式
    fillScreen() {
        
    
            .width('100%')
            .height('100%')
            .backgroundColor('#efefef')
            .padding(20);
    }
}
//# sourceMappingURL=ItemPage.js.map