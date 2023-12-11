import { CommonConstantsTask } from '../constants/CommonConstantsTask';

export default function getCurrentTime(): string {
  let date = new Date();
  let year = date.getFullYear();
  let month = date.getMonth() + CommonConstantsTask.PLUS_ONE;
  let day = date.getDate();
  let hours = date.getHours();
  let minutes = date.getMinutes().toString();
  if (Number.parseInt(minutes) < CommonConstantsTask.TEN) {
    minutes = `0${minutes}`;
  }
  let second = date.getSeconds().toString();
  if (Number.parseInt(second) < CommonConstantsTask.TEN) {
    second = `0${second}`;
  }
  return `${year}/${month}/${day} ${hours}:${minutes}:${second}`;
}