// 任务类
import { Header } from '../components/CommonComponent'
@Observed
class Task {
  static id: number = 1
  //任务名称
  name: string = `任务${Task.id++}`
  //任务状态
  finished: boolean = false
}
//统一的卡片样式
@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({ radius: 6, color: '#1f000000', offsetX: 2, offsetY: 4 })
}
//任务完成样式
@Extend(Text) function finishedTask() {
  .decoration({ type: TextDecorationType.LineThrough })
  .fontColor('#b1b2b1')
}

class StatInfo {
  totalTask: number = 0
  finishTask: number = 0
}

@Entry
@Component
struct PropPage {
  //统计信息
  @Provide stat: StatInfo = new StatInfo()

  build() {

    Column({ space: 10 }) {
      Header({title: '任务管理'})
      //   1.任务进度卡片
      TaskStatistics()
      // 2.任务列表
      TaskList()

    }
    .width('100%').height('100%').backgroundColor('#f1f2f3')
  }
}

@Component
struct TaskStatistics {
  @Consume stat: StatInfo

  build() {
    Row() {
      Text('任务进度').fontSize(30).fontWeight(FontWeight.Bold)
      Stack() {
        Progress({
          value: this.stat.finishTask,
          total: this.stat.totalTask,
          type: ProgressType.Ring
        }).width(100)
        Row() {
          Text(this.stat.finishTask.toString()).fontSize(20).fontColor('#36d')
          Text(' / ' + this.stat.totalTask.toString()).fontSize(20)
        }
      }
    }.card().margin({ top: 20, bottom: 10 }).justifyContent(FlexAlign.SpaceEvenly)
  }
}


@Component
struct TaskList {
  //任务数组
  @State tasks: Task[] = []
  //总任务数量
  @Consume stat: StatInfo

  handleTaskChange() {
    this.stat.totalTask = this.tasks.length
    //更新已完成任务数量
    this.stat.finishTask = this.tasks.filter(item => item.finished).length
  }

  build() {
    Column() {

      //   2.新增任务按钮
      Button('新增任务').width(200).onClick(e => {
        //新增任务数据
        this.tasks.push(new Task())
        //更新总任务数量
        this.handleTaskChange()
      })
      //   3.任务列表
      List({ space: 10 }) {

        ForEach(this.tasks, (item: Task, index: number) => {
          ListItem() {
            TaskItem({ item, onTaskChange: this.handleTaskChange.bind(this) })
          }.swipeAction({ end: this.DeleteButton(index) })
        })
      }.width('100%').alignListItem(ListItemAlign.Center).layoutWeight(1)
    }

  }

  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.ic_public_delete_filled')).fillColor('#fff').width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor('#f00')
    .margin({ left: 10 })
    .onClick(e => {
      this.tasks.splice(index, 1)
      this.handleTaskChange()
    })
  }
}

@Component
struct TaskItem {
  @ObjectLink item: Task
  onTaskChange: () => void

  build() {
    Row() {
      if (this.item.finished) {
        Text(this.item.name).fontSize(20).finishedTask()
      } else {
        Text(this.item.name).fontSize(20)
      }
      Checkbox().select(this.item.finished).onChange(e => {
        //更新当前任务状态
        this.item.finished = e
        //更新已完成任务数量
        this.onTaskChange()
      })
    }.card().justifyContent(FlexAlign.SpaceBetween)
  }
}