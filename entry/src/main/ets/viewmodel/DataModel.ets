import { CommonConstantsTask } from '../common/constants/CommonConstantsTask'
import Logger from '../common/utils/Logger';

const TAG = '[DataModel]'

export class DataModel {
  private targetData: Array<TaskItemBean> = []
  getData(): Array<TaskItemBean> {
    return this.targetData
  }
  deleteData(selectArr: Array<boolean>) {
    if (!selectArr) {
      Logger.error(TAG, '删除失败！选中数据为' + selectArr)
    }
    let dataLen = this.targetData.length - CommonConstantsTask.ONE_TASK
    for (let i = dataLen; i >= 0; i--) {
      if (selectArr[i]) {
        this.targetData.splice(i, CommonConstantsTask.ONE_TASK)
      }
    }
  }
  addData(data:TaskItemBean) {
    if (!data) {
      Logger.error(TAG, '添加数据错误，错误数据为：' + data)
      return
    }
    this.targetData.push(data)
  }
  getLatestProgressValue(): number {
    if (this.targetData.length === 0) {
      return 0
    }
    return this.targetData[this.targetData.length - CommonConstantsTask.ONE_TASK].progressValue
  }
  updateProgress(index: number, updateValue: number, updateDate: string): boolean {
    if (!this.targetData[index]) {
      return false
    }
    this.targetData[index].progressValue = updateValue
    this.targetData[index].updateDate = updateDate
    return true
  }
}

export default new DataModel()

export class TaskItemBean {
  taskName: string
  updateDate: string
  progressValue: number

  constructor(taskName: string, progressValue: number, updateDate: string) {
    this.taskName = taskName
    this.progressValue = progressValue
    this.updateDate = updateDate
  }
}