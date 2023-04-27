import {Controller} from '@hotwired/stimulus'
import dxf, {Helper} from 'dxf'

dxf.config.verbose = true

export default class extends Controller {
  static targets = ['output']

  initialize() {
    this.onReaderLoad = this.onReaderLoad.bind(this)
  }

  change(event) {
    const reader = new FileReader()
    reader.onload = this.onReaderLoad
    reader.readAsBinaryString(event.target.files[0])
  }

  onReaderLoad(event) {
    if (event.target.readyState !== 2) { return }

    const helper = new Helper(event.target.result)
    this.outputTarget.innerHTML = helper.toSVG()
    this.outputTarget.classList.remove("hidden")
  }
}
