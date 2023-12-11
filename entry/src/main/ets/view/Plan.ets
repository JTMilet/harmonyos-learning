import { CommonConstantsTask } from '../common/constants/CommonConstantsTask'
import DataModel , {TaskItemBean} from '../viewmodel/DataModel'
import getCurrentTime from '../common/utils/DateUtil';


@Component
export default struct Plan {
  @State targetData: Array<TaskItemBean> = DataModel.getData()
  @State totalTasksNumber: number = 0
  @State completedTasksNumber: number = 0
  @State latestUpdateDate: string = CommonConstantsTask.DEFAULT_PROGRESS_VALUE
  @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false
  // dialogController: CustomDialogController = new CustomDialogController({
  //   builder: AddTargetDialog({
  //     onClickOk: (value: string): void => this.saveTask(value)
  //   })
  // })
  onProgressChanged () {
    this.totalTasksNumber = this.targetData.length
    this.completedTasksNumber = this.targetData.filter((item: TaskItemBean) => {
      return item.progressValue === CommonConstantsTask.SLIDER_MAX_VALUE
    }).length
    this.latestUpdateDate = getCurrentTime()
  }
  build(){
    Column () {
      // this.titleBar()
    }
  }

  @Builder titleBar () {
    Text($r('app.string.title'))
  }
  // saveTask(taskName: string) {
    // if (taskName === '') {
      // promptAction.showToast({
      //   message: $r('app.string.cannot_input_empty')
      // })
    // }
  // }
}