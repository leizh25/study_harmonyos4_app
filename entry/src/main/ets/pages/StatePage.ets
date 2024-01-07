class Person {
  name: string
  age: number
  gf: Person

  constructor(name: string, age: number, gf?: Person) {
    this.name = name
    this.age = age
    this.gf = gf
  }
}

@Entry
@Component
struct StatePage2 {
  idx: number = 1
  @State p: Person = new Person('Jack', 18, new Person('Rose', 18))
  @State gfs: Person[] = [
    new Person('Rouse', 18),
    new Person('Lucy', 19)
  ]

  build() {
    Column() {
      Text(`${this.p.name} : ${this.p.age}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .fontColor('#36d')
        .onClick(e => this.p.age++)

      Button('添加').onClick(e => {
        this.gfs.push(new Person('女友' + this.idx++, 20))
      })
      // Text(`${this.p.gf.name} : ${this.p.gf.age}`)
      //   .fontSize(50)
      //   .fontWeight(FontWeight.Bold)
      //   .fontColor('#36d')
      //   .onClick(e => this.p.gf.age++)

      Text("=女友列表=").fontSize(50).fontWeight(FontWeight.Bold)
      ForEach(this.gfs, (item: Person, index: number) => {
        Row() {
          Text(`${item.name} : ${item.age}`)
            .fontSize(30)
            .fontColor('#36d')
            .onClick(e => {
              this.gfs[index] = new Person(item.name, item.age + 1)
            })
          Button("删除").onClick(e => {
            this.gfs.splice(index, 1)
          })
        }
        .width("100%").justifyContent(FlexAlign.SpaceAround)
      })

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

@Component
struct StatePage {
  @State name: string = 'Jack'
  @State age: number = 18

  build() {
    Row() {
      Column() {
        Text(`${this.name} : ${this.age}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#36d')
          .onClick(e => this.age++)

      }
      .width('100%')
    }
    .height('100%')
  }
}